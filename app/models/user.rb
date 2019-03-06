class User < ApplicationRecord
  has_many :messages
  has_many :chats, through: :messages
  has_many :user_conversations
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
end
