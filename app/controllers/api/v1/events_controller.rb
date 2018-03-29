class Api::V1::EventsController < ApplicationController
    before_action :get_user, only:[:index]
    before_action :get_event, only:[:update,:destroy, :show]

    def index
        events = @user.events
        render json: events
    end

    def create
        event = Event.new(event_params)
        if event.valid?
            spotify_id = my_user.spotify_id
            event_title = event.title
            encoded = my_user.access_token
            decoded = decode(encoded)
            playlist_response = SpotifyApiAdapter.create_playlist(spotify_id, event_title, decoded)
            event.playlist = Playlist.persist_playlist(playlist_response)
            event.save
            render json: event
        else
            render_error(event)
        end
    end

    def show
        render json: @event
    end

    def update
        @event.assign_attributes(event_params)
        if @event.valid?
            render json: @event
        else
            render_error(@event)
        end
    end

    def destroy
        destroyed_event = EventSerializer.new(@event).attributes
        @event.destroy
        render json: destroyed_event
    end

    private

    def event_params
        params.require(:event).permit(:description, :user_id, :location, :title, :event_date, :starting_time,:ending_time)
    end

    def get_event
        @event = Event.find_by(id: params[:id])
    end

    def get_user
       @user = User.find_by(id: params[:user_id])
    end
end
