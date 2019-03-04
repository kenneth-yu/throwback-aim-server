class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :user_id, :content, :created_at
end
