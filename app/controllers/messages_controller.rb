class MessagesController < ApplicationController
  def create
    @dm_room = DmRoom.find(params[:dm_room_id])
    @message = Message.new(message_params)
    @message.dm_room = @dm_room
    @message.user = current_user
    if @message.save
      redirect_to dm_room_path(@dm_room)
    else
      render "dm_rooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
