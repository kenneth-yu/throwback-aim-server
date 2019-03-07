class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    render :json => @chats, each_serializer: ChatSerializer
  end

  def create

    chat = Chat.new(chat_params)

    if chat.save

        ownership1 = UserConversation.new()
        ownership1.chat_id = chat.id
        ownership1.user_id = params["sender_id"]
        ownership1.save
        ownership2 = UserConversation.new()
        ownership2.chat_id = chat.id
        ownership2.user_id = params["receiver_id"]
        ownership2.save

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
    end
    render :json => @chat, each_serializer: ChatSerializer
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
