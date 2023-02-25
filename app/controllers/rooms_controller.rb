class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    # ログインしているユーザじゃない方のユーザの情報を取得
    @user = @room.users.find{|user| user != current_user}
    @messages = @room.messages
    @message = Message.new
  end
  def create
    user_id = params[:user_id]
    room = Room.create
    room.entries.create(user_id: current_user.id)
    room.entries.create(user_id: user_id)
    redirect_to room_path(room.id)

  end


end
