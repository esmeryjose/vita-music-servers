class Api::V1::TracksController < ApplicationController
    before_action :get_playlist, only:[:create]
    def create
        track = Track.new(track_params)
        if track.valid?
            spotify_id = my_user.spotify_id
            encoded = my_user.access_token
            decoded = decode(encoded)
            SpotifyApiAdapter.add_track_to_playlist(spotify_id, @playlist.spotify_id, params["track"]["uri"], decoded)
            track.save
            render json: track
        else
            render_error(track)
        end
    end

    private

    def get_playlist
        @playlist = Playlist.find_by(id: params["track"]["playlist_id"])
    end

    def track_params
        params.require(:track).permit(:name, :artists, :uri, :playlist_id, :spotify_id)
    end
end
