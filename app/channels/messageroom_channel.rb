class MessageroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    chatroom = MessageRoom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
  end
end
