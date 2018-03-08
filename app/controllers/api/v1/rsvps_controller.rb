class Api::V1::RsvpsController < ApplicationController
        before_action :get_rsvp, only:[:destroy]

    def create
        rsvp = Rsvp.new(rsvp_params)
        if rsvp.valid?
            rsvp.save
            render json: rsvp
        else
            render_error(rsvp)
        end
    end

    def destroy
        destroyed_rsvp = RsvpSerializer.new(@rsvp).attributes
        @rsvp.destroy
        render json: destroyed_rsvp
    end

    private

    def rsvp_params
        params.require(:rsvp).permit(:user_id, :event_id)
    end

    def get_rsvp
        @rsvp = Rsvp.find_by(id: params[:id])
    end
end

