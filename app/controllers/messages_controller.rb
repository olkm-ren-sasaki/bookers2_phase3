class MessagesController < ApplicationController
  def create
    @message = current_user.messages.new(message_params)
    @message.room_id = params[:room_id]
    if @message.save
      redirect_to request.referrer
    else
      @message = room.messages
      render "room/show"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
