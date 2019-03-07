class PresenceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "presence_channel"
    current_user.logged_in = true
    current_user.save

    ActionCable.server.broadcast("presence_channel", {type: "CO_USER", user: current_user.id})
  end

  def unsubscribed
  

    ActionCable.server.broadcast("presence_channel", {type: "DC_USER", user: current_user.id})
  end
end
