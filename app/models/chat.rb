class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_conversations
  belongs_to :friendship
end
