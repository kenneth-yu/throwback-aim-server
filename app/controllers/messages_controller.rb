class MessagesController < ApplicationController

  def index
    @messages = Message.all
    render :json => @messages, each_serializer: MessageSerializer
  end

  def create
    if message_params[:chat_id]
      message = Message.new(message_params)
    else
      chat = Chat.new()
      message = Message.new(content: message_params[:content], user_id: message_params[:user_id], chat_id: chat.id)
    end
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to chat, serialized_data
      head :ok
    end
  end

  def show
    @message = Message.find(params[:id])
    render :json => @message, each_serializer: MessageSerializer
  end

  private
  def message_params
    params.require(:message).permit(:content, :user_id, :chat_id)
  end
end
