class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    render :json => @chats, each_serializer: ChatSerializer
  end

  def create

    chat = Chat.new(chat_params)

    if chat.save

        serialized_data = ActiveModelSerializers::Adapter::Json.new(
            ChatSerializer.new(chat)
        ).serializable_hash


        ActionCable.server.broadcast(
            "current_user_#{current_user.id}",
            serialized_data
        )

        ActionCable.server.broadcast(
            "current_user_#{params["receiver_id"]}",
            serialized_data
        )
        head :ok
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
