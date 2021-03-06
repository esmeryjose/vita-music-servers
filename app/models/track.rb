class Track < ApplicationRecord
    belongs_to :playlist
    has_many :votes, dependent: :destroy
    has_many :voters, through: :votes, source: :voter
end
