class ChatSerializer < ActiveModel::Serializer
  attributes :id, :friendship
  has_many :messages
  has_many :users, serializer:ConversationUserSerializer
end
