class Api::V1::VotesController < ApplicationController
    before_action :get_vote, only:[:destroy]

    def create
        vote = Vote.new(votes_params)
        if vote.valid?
            vote.save
            render json: vote
        else
            render_error(vote)
        end
    end

    def destroy
        destroyed_vote = VoteSerializer.new(@vote).attributes
        @vote.destroy
        render json: destroyed_vote
    end

    private

    def votes_params
        params.require(:vote).permit(:track_id, :user_id)
    end

    def get_vote
        @vote = Vote.find_by(id: params[:id])
    end
end
