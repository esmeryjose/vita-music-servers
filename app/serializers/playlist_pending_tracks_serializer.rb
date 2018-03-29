class PlaylistPendingTracksSerializer < ActiveModel::Serializer
  attributes :id, :spotify_id, :uri, :voters
end
