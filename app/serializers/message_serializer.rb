class MessageSerializer < ActiveModel::Serializer
  attributes :id, :chat_id, :user_id, :content, :created_at
  has_one :user
  has_one :chat
end
