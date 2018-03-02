class Event < ApplicationRecord
    belongs_to :admin, class_name: "User", foreign_key: "user_id"
    has_many :rsvps
    has_many :attendees, -> { where(rsvps: {accepted: true}) }, through: :rsvps, source: :attendee
    has_one :playlist
end
