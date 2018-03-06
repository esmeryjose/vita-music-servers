class Event < ApplicationRecord
    belongs_to :admin, class_name: "User", foreign_key: "user_id"
    has_many :rsvps, dependent: :destroy
    has_many :attendees, -> { where(rsvps: {accepted: true}) }, through: :rsvps, source: :attendee, dependent: :destroy
    has_one :playlist, dependent: :destroy
    validates :location, presence: true
    validates :title, presence: true
    validate :no_repeat_name

    def no_repeat_name
        if !self.admin.events.where(title: self.title).empty?
            self.errors.add(:title, "has to be unique")
        end
    end
end
