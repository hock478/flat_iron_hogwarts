class MessagesController < ApplicationController
 

    def create 
        @message = Message.create(message_params)
        redirect_to user_path(@message.receiver_id)
    end

    private 

    def message_params 
        params.require(:message).permit(:sender_id, :receiver_id, :content)
    end
end
