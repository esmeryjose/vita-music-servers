class Rsvp < ApplicationRecord
    belongs_to :attendee, class_name: :User, foreign_key: :user_id
    belongs_to :event
    validate :no_repeat_user

    def no_repeat_user
        if !Rsvp.where(user_id: self.user_id, event_id: self.event_id).empty?
            self.errors.add(user_id: "has to be unique")
        end
    end
end