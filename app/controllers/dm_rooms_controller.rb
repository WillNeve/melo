class DmRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dm_rooms = DmRoom.public_channels
  end

  def show
    users = [current_user, User.find(params[:id])]
    @targetuser = User.find(params[:id])
    @dm_room = DmRoom.direct_message_for_users(users)
    @dm_rooms = current_user.dm_rooms
    @messages = @dm_room.messages.order(created_at: :desc).limit(100).reverse
    @messagelast = @dm_room.messages.last(1)
    render "dm_rooms/show"
  end

  def create
    @dm_roomuser = @dm_room.users.where(user_id: current_user.id).first_or_create
    redirect_to @dm_room
  end

  def destroy
    @dm_roomuser = @dm_room.users.where(user_id: current_user.id).destroy_all
    redirect_to dm_rooms_path
  end

  private

  def dm_roomuserlocator
    @dm_roomlocator = dm_room.find(params[:dm_room_id])
  end
end
