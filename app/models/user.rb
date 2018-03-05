class User < ApplicationRecord
    has_many :events, source: :admin, dependent: :destroy
    has_many :rsvps, source: :attendee, dependent: :destroy
    has_many :attending_events, -> { where(rsvps: {accepted: true}) }, through: :rsvps, source: :event
    has_many :pending_events, -> { where(rsvps: {accepted: false}) },through: :rsvps, source: :event
    # has_many :votes, source: :attendee, dependent: destroy
    # has_many :tracks, through: :votes

    validates :display_name, :spotify_id, :spotify_url, :uri, presence: true

    def access_token_expired?
        (Time.now - self.updated_at) > ENV["SOME_TIME"].to_i
    end
end