class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :user1, :user2
  has_many :chats
end
