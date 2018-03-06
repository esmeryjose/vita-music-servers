class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :location, :user_id, :title
end
