class Vote < ApplicationRecord
    belongs_to :track
    belongs_to :voter, class_name: :User, foreign_key: :user_id
    validate :count_between_zero_and_five

    def count_between_zero_and_five
        if self.count > 5 || self.count < 0
            self.count = 5 if self.count == 6
            self.count = 0 if self.count == -1
            self.errors.add(count: "cannot be less than 0 or greated than 5")
        end
    end

    def vote_up
        self.count +=1
    end

    def vote_down
        self.count -=1
    end

end
