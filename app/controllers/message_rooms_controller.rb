class MessageRoomsController < ApplicationController
  def create
    # steps:
    # take current user and target user
    target_user_id = Artist.find(params[:id]).user.id
    target_user = User.find(target_user_id)
    # check if room already exists with these 2 users, if so redirect to it
    if check_for_room(target_user)
      redirect_to message_room_path(check_for_room(target_user))
    else
      # create the room if it doesnt exist
      @room = MessageRoom.create
      # create the references with users_rooms
      UsersRoom.create(user: current_user, message_room: @room)
      UsersRoom.create(user: target_user, message_room: @room)
      # redirect user to that new room
      redirect_to message_room_path(@room)
    end
  end

  def show
    @no_menu = true;
    @room = MessageRoom.find(params[:id])
    if current_user.message_rooms.include?(@room)
      @messages = @room.messages
      @message = Message.new

      @room.users.each do |user|
        @other_user = user if user != current_user
      end
    else
      redirect_to room_access_denied_path
    end
  end

  def index
    # find all a users_rooms
    @rooms = current_user.message_rooms.order(created_at: :desc)
  end

  def denied
  end

  private

  def check_for_room(target_user)
    current_user.message_rooms.each do |room|
      return room if room.users.include?(target_user)
    end
    return false
  end
end
