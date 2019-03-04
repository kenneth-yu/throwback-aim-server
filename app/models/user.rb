class User < ApplicationRecord
  has_many :messages
  has_many :chats, through: :messages
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
end
