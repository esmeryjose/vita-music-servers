class Vote < ApplicationRecord
    belongs_to :track
    belongs_to :voter, class_name: :User, foreign_key: :user_id

    validate :no_repeat_user

    def no_repeat_user
        if Vote.find_by(user_id: self.user_id, track_id:self.track_id)
            self.errors.add(:user, "can only vote once")
        end
    end

end
