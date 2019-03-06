class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chats_channel"
    stream_from "current_user_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
