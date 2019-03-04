class User < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :chats, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  has_secure_password
end
