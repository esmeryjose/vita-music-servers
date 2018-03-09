class Playlist < ApplicationRecord
    belongs_to :event
    has_many :tracks, dependent: :destroy
    has_many :votes, through: :tracks
    has_many :pending_tracks,->{where(pending: true)}, class_name: :Track
    has_many :added_tracks,->{where(pending: false)}, class_name: :Track

    def self.persist_playlist(playlist_response)
        parsed_playlist = parse_playlist(playlist_response)
        new(parsed_playlist)
    end

    def self.parse_playlist(playlist_response)
        parsed = {
            name: playlist_response["name"],
            uri: playlist_response["uri"],
            href: playlist_response["href"],
            spotify_id: playlist_response["id"]
        }
    end
end
