class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_chall"
    userMsgs = Message.all.select do |msg|
      msg.user_id == current_user.id
    end
    ActionCable.server.broadcast("messages_channel", {messages: userMsgs})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
