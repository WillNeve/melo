class BookingsController < ApplicationController
  def index
    @bookings = User.bookings
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
    @bookings = Booking.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @booking = Booking.new
    @artist = artist.find(params[:artist_id])
    @user = user.find(params[:artists_id])
  end

  def show
    @user = current_user
    @booking = Booking.new(params[:booking_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @artist = artist.find(params[:artist_id])
    @user = current_user
    @booking.user = @user
    @booking.artist = @artist
    if @booking.save
      redirect_to confirmation_booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @user = current_user
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking, @booking_message)
    else
      render :edit, status: :unprocessable_entite
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def confirmation
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
