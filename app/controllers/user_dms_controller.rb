class UserDmsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dm_room

  def create
    @dm_roomuser = @dm_room.users.where(user_id: current_user.id).first_or_create
    redirect_to @dm_room
  end

  def destroy
    @dm_roomuser = @dm_room.users.where(user_id: current_user.id).destroy_all
    redirect_to dm_rooms_path
  end

  private

  def set_dm_room
    @dm_room = dm_room.find(params[:dm_room_id])
  end
end
