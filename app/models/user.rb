class User < ApplicationRecord
    has_many :events, source: :admin
    has_many :rsvps, source: :attendee
    has_many :attending_events, -> { where(rsvps: {accepted: true}) }, through: :rsvps, source: :event
    has_many :pending_events, -> { where(rsvps: {accepted: false}) },through: :rsvps, source: :event

    def access_token_expired?
        (Time.now - self.updated_at) > ENV["SOME_TIME"].to_i
    end
end