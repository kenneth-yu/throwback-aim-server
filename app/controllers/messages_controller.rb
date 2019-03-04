class MessagesController < ApplicationController

  def index
    @messages = Message.all
    render :json => @messages, each_serializer: MessageSerializer
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chat_channel",
                                    content: message.content
    end
  end

  def show
    @message = Message.find(params[:id])
    render :json => @message, each_serializer: MessageSerializer
  end

  private
  def message_params
    params.require(:message).permit(:content, :created_at, :user_id)
  end
end
