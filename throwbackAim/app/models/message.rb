class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
