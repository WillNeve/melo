class DmRoomsController < ApplicationController
  def show
    @message = Message.new
    @dm_room = DmRoom.find(params[:id])
  end

  def create
    DmRoom.new
  end
end
