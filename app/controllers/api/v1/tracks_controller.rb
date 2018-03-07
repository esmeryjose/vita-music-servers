class Api::V1::TracksController < ApplicationController
    def create
        track = Track.new(track_params)
        if track.valid?
            track.save
            render json: track
        else
            render_error(track)
        end
    end

    private

    def track_params
        params.require(:track).permit(:name, :artists, :uri, :playlist_id)
    end
end
