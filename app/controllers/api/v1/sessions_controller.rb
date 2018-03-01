class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def show
    render json: my_user
  end

  def create

    query_params = {
      client_id: ENV["CLIENT_ID"],
      response_type: "code",
      redirect_uri: ENV["REDIRECT_URI"],
      scope: "playlist-modify-private",
      show_dialog: true
    }

    url = "https://accounts.spotify.com/authorize"
    redirect_to "#{url}?#{query_params.to_query}"
  end
end
