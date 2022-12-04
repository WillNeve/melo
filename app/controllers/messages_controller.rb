class MessagesController < ApplicationController
  def create
    @content = params["message"]["content"]
    @message = Message.new(content: @content)
    @message.user = current_user
    @message_room = MessageRoom.find(params[:message_room_id])
    @message.message_room = @message_room
    return unless @message.save

    MessageroomChannel.broadcast_to(
      @message_room,
      render_to_string(partial: "message", locals: { message: @message })
    )
    head :ok
  end
end
