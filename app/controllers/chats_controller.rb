class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    render :json => @chats, each_serializer: ChatSerializer
  end

  def create
    @chat = Chat.create(chat_params)
    
    render :json => @chat, each_serializer: ChatSerializer
  end

  def show
    @chat = Chat.find(params[:id])
    render :json => @chat, each_serializer: ChatSerializer
  end

  private
  def chat_params
    params.require(:chat).permit(:id, :created_at)
  end
end
