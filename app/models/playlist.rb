class Playlist < ApplicationRecord
    belongs_to :event
    has_many :tracks, dependent: :destroy
    has_many :votes, through: :tracks
    has_many :pending_tracks,->{where(pending: true)}, class_name: :Track
    has_many :added_tracks,->{where(pending: false)}, class_name: :Track
end
