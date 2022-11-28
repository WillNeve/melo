class ArtistsController < ApplicationController
  def index
  end

  def new
    @artist = Artist.new
  end

  def new_artist_guidelines
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

  def new_artist_confirmation
    @artist = current_user.artist
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :is_group, :genre, :description, :instrument, :avatar, :banner, :photos, :soundcloud_url, :spotify_url, :bandcamp_url, :instagram_url, :tiktok_url)
  end
end
