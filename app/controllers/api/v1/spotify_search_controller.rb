class Api::V1::SpotifySearchController < ApplicationController

    def recommended_tracks
        playlist = Playlist.find_by(id:params[:id])
        spotify_response = SpotifyApiAdapter.recommended_tracks(playlist.tracks_spotify_ids)
        tracks = parse_tracks(spotify_response)
        render json: tracks
    end

    def tracks
        encoded = my_user.access_token
        decoded = decode(encoded)
        spotify_response = SpotifyApiAdapter.search_tracks(params[:q], decoded)
        tracks = parse_tracks(spotify_response)
        render json: tracks
    end

    private

    def parse_tracks(spotify_response)
        spotify_response["tracks"]["items"].map do |track|
            {
                name: track["name"],
                uri: track["uri"],
                spotify_id: track["id"],

            }
        end
    end

end
