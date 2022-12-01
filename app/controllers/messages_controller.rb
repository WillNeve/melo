class MessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @targetuser = User.find(params[:id])
    users = [current_user, @targetuser]
    @dm_room = dm_room.direct_message_for_users(users)
    @dm_roomall = dm_room.all
    @messages = @dm_room.messages.order(created_at: :desc).limit(100).reverse
    @messagelast = @dm_room.messages.last(1)
    render "dm_rooms/show"
  end

  private

  def dm_room_user_locator
    @dm_room_locator = DmRoom.find(params[:dm_room_id])
  end
end
