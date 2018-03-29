class Api::V1::SearchController < ApplicationController
    before_action :get_events_search
    before_action :get_users_search

    def index
        my_users = @users.to_json(:only => [ :id, :display_name, :spotify_id, :spotify_url, :uri, :profile_img_url])
        my_events = @events.to_json(:only => [ :id, :description, :location, :user_id, :title, :starting_time, :ending_time, :event_date], :include => { :admin => { :only => [:id, :display_name] }})
        render json: {users: my_users, events: my_events}
    end

    private

    def get_events_search
        @events = Event.where("title ~* ? OR description ~* ? OR location ~* ?", params[:q],params[:q],params[:q])
    end

    def get_users_search
        @users = User.where("display_name ~* ? ", params[:q])
    end
end
