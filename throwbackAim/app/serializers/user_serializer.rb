class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :messages
  has_many :chats, through: :messages
end
