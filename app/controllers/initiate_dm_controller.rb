class InitiateDmController < ApplicationController
  def initiate
    @user = current_user
    @target_user = User.find(params[:id])
    # if false there is already a room with user and target user redirect to that room
      # find the id of that room
      redirect_to dm_room_path(id_goes_here)
    else
      @dm_room = DmRoom.new
      @user_dm_link1 = UserDm.new
      @user_dm_link1.user = @user
      @user_dm_link1.dm_room = @dm_room

      @user_dm_link2 = UserDm.new
      @user_dm_link2.user = @target_user
      @user_dm_link2.dm_room = @dm_room

      @user_dm_link1.save
      @user_dm_link2.save
      redirect_to dm_room_path(@dm_room)
    end
  end
end
