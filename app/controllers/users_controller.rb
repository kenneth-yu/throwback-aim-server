class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render :json => @users, each_serializer: UserSerializer
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create new user' }, status: :not_acceptable
    end
  end

  def show
    @user = User.find(params[:id])
    render :json => @user, each_serializer: UserSerializer
  end

  private
  def user_params
    params.require(:user).permit(:username, :id, :logged_in, :password)
  end
end
