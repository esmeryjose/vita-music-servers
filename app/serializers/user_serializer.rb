class UserSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :spotify_id, :spotify_url, :uri
end
