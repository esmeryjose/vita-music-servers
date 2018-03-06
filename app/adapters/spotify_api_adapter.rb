class SpotifyApiAdapter
    URLS={
        auth:"https://accounts.spotify.com/api/token",
        me:"https://api.spotify.com/v1/me",
        create_playlist:"https://api.spotify.com/v1/users/{user_id}/playlists",
    }

    def self.body_params
        body = {
            client_id: ENV['CLIENT_ID'],
            client_secret: ENV["CLIENT_SECRET"]
        }
    end

    def self.refresh_access_token(refresh_token)
        body = body_params.dup
        body[:grant_type] = "refresh_token"
        body[:refresh_token] = refresh_token

        auth_params = authorize(body)
        auth_params["access_token"]
    end

    def self.login(code)
        body = body_params.dup
        body[:grant_type] = "authorization_code"
        body[:code] = code
        body[:redirect_uri] = ENV['REDIRECT_URI']

        authorize(body)
    end
    
    def self.authorize(body)
        auth_response = RestClient.post(URLS[:auth], body)
        JSON.parse(auth_response.body)
    end

    def self.create_playlist(user_id,access_token)

        header = {
            Authorization: "Bearer #{access_token}",
            "Content-Type": "application/json"
        }

        body= {
            name:"Test",
            public: false
        }

        auth_response = RestClient.post(URLS[:auth], body, header)
        JSON.parse(auth_response.body)
    end

    def self.getUserData(access_token)
        
        header = {
            Authorization: "Bearer #{access_token}"
        }

        user_response = RestClient.get(URLS[:me], header)

        JSON.parse(user_response.body)
    end
end