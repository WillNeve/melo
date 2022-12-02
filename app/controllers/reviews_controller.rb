require 'date'

class ReviewsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @reviews = @artist.reviews
  end

  def new
    @review = Review.new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @review = Review.new(review_params)
    @artist = Artist.find(params[:artist_id])
    @review.artist = @artist
    @review.user = current_user
    if @review.save
      redirect_to artist_path(@artist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @review = Review.new(params[:artist_id])
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
