class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :spotify_id, :uri
end
