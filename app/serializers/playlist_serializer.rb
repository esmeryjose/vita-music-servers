class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :spotify_id, :uri

  has_many :pending_tracks, serializer: PlaylistPendingTracksSerializer
  has_many :added_tracks

end
