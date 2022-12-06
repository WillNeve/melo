class OrdersController < ApplicationController
  def create
    booking = Booking.find(params[:booking_id])
    booking_start = DateTime.parse(booking.start_date.to_s)
    booking_end = DateTime.parse(booking.end_date.to_s)
    range = (booking_end - booking_start).to_f
    range_hours = range * 24
    order = Order.create!(artist: booking.artist, artist_sku: booking.artist.name, amount_cents: booking.artist.rate * range_hours , state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'gbp',
          unit_amount: (booking.artist.rate_cents * range_hours).round(0),
          product_data: {
            name: booking.artist.name
          }
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end




  def show
    @order = current_user.orders.find(params[:id])
  end
end
