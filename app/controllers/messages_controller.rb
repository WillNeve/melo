class MessagesController < ApplicationController
  def create
    @content = params["message"]["content"]
    @message = Message.new(content: @content)
    @message.user = current_user
    @message.message_room = MessageRoom.find(params[:message_room_id])
    @message.save
  end
end
