class ChatSerializer < ActiveModel::Serializer
  attributes :id, :friendship
  has_many :messages
end
