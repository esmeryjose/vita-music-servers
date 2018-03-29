class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :location, :user_id, :title, :starting_time, :ending_time, :event_date

  has_one :playlist
  belongs_to :admin
  has_many :attendees
  has_many :pending
end
