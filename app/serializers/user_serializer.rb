class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :logged_in
  has_many :messages
  has_many :chats
end
