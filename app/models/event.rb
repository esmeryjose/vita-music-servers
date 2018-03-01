class Event < ApplicationRecord
    belongs_to :admin, class_name: "User", foreign_key: "user_id"
    has_many :rsvps
    has_many :attendees, through: :rsvps, class_name: "User"
end
