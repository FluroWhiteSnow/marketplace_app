class ConversationsController < ApplicationController
  before_action :authenticate_user! 
   
  def index
    @users = User.all
    @conversations = Conversation.all
  end

  #creating a conversation with a specific user based on their  user:ID
  def create  
    if Conversation.between(params[:sender_id], params[:recipient_id]).present? 
       @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
       @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_path(@conversation)
  end

  #shows conversaion
  def show 
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages 
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
