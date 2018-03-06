class Api::V1::EventsController < ApplicationController
    before_action :get_user, only:[:index]
    before_action :get_event, only:[:update,:destroy]

    def index
        events = @user.events
        render json: events
    end
    
    def create
        event = Event.new(event_params)
        if event.valid?
            event.save
            render json: event
        else
            render_error(event)
        end
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
        params.require(:event).permit(:description, :user_id, :location, :title)
    end

    def get_event
        @event = Event.find_by(id: params[:id])
    end

    def get_user
       @user = User.find_by(id: params[:user_id])
    end
end
