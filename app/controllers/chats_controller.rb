class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    render :json => @chats, each_serializer: ChatSerializer
  end

  def create

    chat = Chat.new()

    if chat.save
      render :json => @chat, each_serializer: ChatSerializer
    end
  end

  def show
    @chat = Chat.find(params[:id])
    render :json => @chat, each_serializer: ChatSerializer
  end

  private
  def chat_params
    params.require(:chat).permit(:id, :created_at, :sender_id, :receiver_id)
  end
end
