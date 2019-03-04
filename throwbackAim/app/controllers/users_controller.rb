class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users, each_serializer: UserSerializer
  end

  def create
    @user = User.create(user_params)
    render :json => @user, each_serializer: UserSerializer
  end

  def show
    @user = User.find(params[:id])
    render :json => @user, each_serializer: UserSerializer
  end

  private
  def user_params
    params.require(:user).permit(:username, :id)
  end
end
