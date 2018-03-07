class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :location, :user_id, :title

  has_one :playlist
  belongs_to :admin
  has_many :attendees
  has_many :pending
end
