class ArtistsController < ApplicationController
  def index
    @index = true
    if params[:query].present?
      sql_query = <<~SQL
        artists.name @@ :query
        OR artists.genre @@ :query
        OR artists.instrument @@ :query
      SQL
      @artists = Artist.where(sql_query,query: "%#{params[:query]}%")
    else
      @artists = Artist.all
    end
  end

  def new
    if current_user.artist
      redirect_to artist_already_exists_path
    end
    @artist = Artist.new
  end

  def new_artist_guidelines
    @no_buttons = true
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    if @artist.save
      redirect_to new_artist_confirmation_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @booking = Booking.new
  end

  def new_artist_confirmation
    @artist = current_user.artist
  end

  def artist_already_extists
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :is_group, :genre, :description, :instrument, :banner, :soundcloud_url, :spotify_url, :bandcamp_url, :instagram_url, :tiktok_url, photos: [])
  end
end
