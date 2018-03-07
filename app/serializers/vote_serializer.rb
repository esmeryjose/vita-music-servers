class VoteSerializer < ActiveModel::Serializer
  attributes :id, :track_id, :user_id
end
