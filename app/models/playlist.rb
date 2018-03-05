class Playlist < ApplicationRecord
    belongs_to :event
    has_many :tracks, dependent: :destroy
end
