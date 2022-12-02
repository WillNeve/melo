class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def landing
    return unless current_user

    case current_user.role
    when 'booker'
      redirect_to artists_path
    when 'artist'
      @artist = current_user.artist
      redirect_to dashboard_path(@artist)
    end
  end

  def chatroom
    @dm_room.all
  end

  def new_user
    @no_buttons = true
  end

  def dashboard
  end
  
end
