class Api::V1::PlaylistsController < ApplicationController
    before_action :get_playlist, only:[:show]

    def show
        render json: @playlist
    end

    private

    def get_playlist
        @playlist = Playlist.find_by(id:params[:id])
    end
end
