class ChatSerializer < ActiveModel::Serializer
  attributes :id, :user1, :user2
  has_many :messages
end
