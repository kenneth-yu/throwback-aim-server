class UsersChannel < ApplicationCable::Channel
  def subscribed
    @user = User.find_by(id: params[:id])
    @user.logged_in = true
    @user.save
    stream_from "users_channel"
  end

  def received(data)
    UsersChannel.broadcast_to(@user, {user: @user, users: @user.logged_in})
  end

  def unsubscribed
    @user.logged_in = false
    @user.save
  end
end
