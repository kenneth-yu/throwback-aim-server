class UserConversationSerializer < ActiveModel::Serializer
  attributes :id, :chat_id, :user_id
end
