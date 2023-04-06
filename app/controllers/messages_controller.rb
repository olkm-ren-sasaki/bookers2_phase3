class MessagesController < ApplicationController
  def create
    @message = current_user.messages.new(message_params)
    @message.room_id = params[:room_id]
    
    if @message.save
      redirect_to request.referrer
    else
      @room = Room.find(params[:room_id])
      @user = @room.users.find{|user| user != current_user}
      @messages = @room.messages
      render "rooms/show"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
