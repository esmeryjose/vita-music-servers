class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :artists, :uri
end
