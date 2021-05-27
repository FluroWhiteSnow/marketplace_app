class MessagesController < ApplicationController
    before_action do
        @conversation = Conversation.find(params[:conversation_id])
    end
    

    def index
        @messages = @conversation.messages
        @message = @conversation.messages.new
    end
    
    def new
        @message = @conversation.messages.new
    end
    
    def create
        @conversation = Conversation.find(params[:conversation_id])
        @message = @conversation.messages.create(message_params)
        redirect_to conversation_path(@conversation)
    end

    private
    
    def message_params
        params.require(:message).permit(:body, :user_id)
    end

end
