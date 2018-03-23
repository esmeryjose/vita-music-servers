class UserSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :spotify_id, :spotify_url, :uri, :profile_img_url
end
