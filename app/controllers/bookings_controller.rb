class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show edit update destroy confirmation confirm]
  def index
    @bookings = current_user.bookings.order(created_at: :desc)
    # Scope your query to the dates being shown:
    # start_date = params.fetch(:start_date, Date.today).to_date
    # @bookings = Booking.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @booking = Booking.new
    @artist = Artist.find(params[:artist_id])
    @user = current_user
  end

  def show
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @artist = Artist.find(params[:artist_id])
    @user = current_user
    @booking.user = @user
    @booking.artist = @artist
    return if @booking.save

    render :new, status: :unprocessable_entity
  end

  def edit
    # @user = current_user
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking, @booking_message)
    else
      render :edit, status: :unprocessable_entite
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def confirmation
  end

  def confirm
    @booking.update(confirmed: true)
    redirect_to calendar_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :location, :event_type)
  end
end
