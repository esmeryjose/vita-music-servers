class SpotifyApiAdapter
    URLS={
        "auth" => "https://accounts.spotify.com/api/token",
        "me" => "https://api.spotify.com/v1/me",
        "users" => "https://api.spotify.com/v1/users",
        "s_track" => "https://api.spotify.com/v1/search?type=track&q=",
        "r_tracks" => "https://api.spotify.com/v1/recommendations?seed_tracks="
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
        auth_response = RestClient.post(URLS["auth"], body)
        JSON.parse(auth_response.body)
    end

    def self.create_playlist(user_id,playlist_name,access_token)

        url = "#{URLS["users"]}/#{user_id}/playlists"
        header = {
            "Authorization": "Bearer #{access_token["token"]}",
            "Content-Type": "application/json"
        }
        body= {
            "name": "#{playlist_name}-playlist",
            "public": false
        }

        auth_response = RestClient.post(url, body.to_json, header)
        JSON.parse(auth_response.body)
    end

    def self.add_track_to_playlist(user_id,playlist_id,track_uri,access_token)
        
        url = "#{URLS["users"]}/#{user_id}/playlists/#{playlist_id}/tracks"
        header = {
            "Authorization": "Bearer #{access_token["token"]}",
            "Content-Type": "application/json"
        }
        body = {
            "uris": [track_uri]
        }
        
        RestClient.post(url, body.to_json, header)
    end

    def self.recommended_tracks(track_ids)
        
        header = {
            "Authorization": "Bearer #{access_token["token"]}"
        }
        url = "#{URLS["r_tracks"]}#{track_ids}"
        
        recommended_tracks_response = RestClient.get(url, header)
        JSON.parse(recommended_playlist_response.body)
    end

    def self.search_tracks(track_name, access_token)
        header = {
            "Authorization": "Bearer #{access_token["token"]}"
        }
        url = "#{URLS["s_track"]}#{track_name}"

        user_response = RestClient.get(url, header)
        JSON.parse(user_response)
    end

    def self.getUserData(access_token)
        
        header = {
            "Authorization": "Bearer #{access_token}"
        }
        user_response = RestClient.get(URLS["me"], header)

        JSON.parse(user_response.body)
    end
end