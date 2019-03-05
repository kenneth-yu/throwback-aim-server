class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
    render :json => @friendships, each_serializer: FriendshipSerializer
  end

  def create
    @friendship = Friendship.create(friendship_params)
    render :json => @friendship, each_serializer: FriendshipSerializer
  end

  def show
    @friendship = Friendship.find(params[:id])
    render :json => @friendship, each_serializer: FriendshipSerializer
  end

  private
  def friendship_params
    params.require(:friendship).permit(:id, :created_at)
  end
end
