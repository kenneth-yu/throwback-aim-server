class UsersChannel < ApplicationCable::Channel
  def subscribed
    @user = User.find_by(id: params[:id])
    stream_from "users_channel"
  end

  def received(data)
    UsersChannel.broadcast_to(@user, {user: @user, users: @user.logged_in})
  end

  def unsubscribed
  end
end
