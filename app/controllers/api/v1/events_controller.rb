class Api::V1::EventsController < ApplicationController
    def create
        event = Event.new(event_params)
        if event.valid?
            event.save
            render json: event
        else
            render_error(event)
        end
    end

    private

    def event_params
        params.require(:event).permit(:description, :user_id, :location, :title)
    end
end
