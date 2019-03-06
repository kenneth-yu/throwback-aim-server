class UserConversationsController < ApplicationController
  def index
    @user_conversations = UserConversation.all
    render :json => @user_conversations, each_serializer: UserConversationSerializer
  end

  def create
    @user_conversation = UserConversation.create(user_conversation_params)

    render :json => @user_conversation, each_serializer: UserConversationSerializer
  end

  def show
    @user_conversation = UserConversation.find(params[:id])
    render :json => @user_conversation, each_serializer: UserConversationSerializer
  end

  private
  def user_conversation_params
    params.require(:user_conversation).permit(:id, :chat_id, :user_id)
  end
end
