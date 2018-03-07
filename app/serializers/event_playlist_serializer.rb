class EventPlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :spotify_id, :uri, :tracks
end
