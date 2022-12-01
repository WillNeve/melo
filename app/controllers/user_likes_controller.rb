class UserLikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @likes = current_user.user_likes
  end

  def create
    like = UserLike.new
    like.user = current_user
    like.artist = Artist.find(params[:artist_id])
    like.save
    respond_to do |format|  ## Add this
      format.json { render json: like, status: :ok }
      format.html { redirect_to artists_path }
    end
  end

  def destroy
    like = UserLike.find(params[:id])
    like.destroy
    respond_to do |format|  ## Add this
      format.json { render json: {}, status: :ok }
      format.html { redirect_to artists_path }
    end
  end
end
