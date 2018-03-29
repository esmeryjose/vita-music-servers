class ApplicationController < ActionController::API

    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authorized
  
    private
  
    def issue_token(payload)
        JWT.encode(payload, ENV["SOME_SECRET"], ENV["SOME_SUPER_SECRET"])
    end
  
    def decode(jwt_token)
        my_algorithm = { algorithm: ENV["SOME_SUPER_SECRET"]}
        JWT.decode(jwt_token, ENV["SOME_SECRET"], true, my_algorithm)[0]
    end
  
    def my_user_id
        authenticate_or_request_with_http_token do |jwt_token, options|
            decoded_token = decode(jwt_token)
            current_user_id = decoded_token[0]["user_id"]
        end
    end
  
    def my_user
        authenticate_or_request_with_http_token do |jwt_token, options|
            begin
                decoded_token = decode(jwt_token)
            rescue JWT::DecodeError
                return nil
            end
            if decoded_token["user_id"]
                @current_user ||= ::User.find(decoded_token["user_id"])
            end
        end
    end
  
    def logged_in?
        !!my_user
    end
  
    def authorized
        logged_in? ?
        check_for_refresh(my_user) :
        (render json: {message: "Not welcome" }, status: 401)
    end
  
    def check_for_refresh(my_user)
        if my_user.access_token_expired?
            refresh_token = decode(my_user.refresh_token)
            token = refresh_token["token"]
            access_token = SpotifyApiAdapter.refresh_access_token(token)
            encodedAccess = issue_token({token: access_token})
            my_user.update(access_token: encodedAccess)
        end
    end

    def render_error(obj)
        render json:{error: obj.errors.messages} , status: 404
    end
end
