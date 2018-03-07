class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :spotify_id, :uri

  has_many :tracks
end
