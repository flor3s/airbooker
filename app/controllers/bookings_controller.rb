class BookingsController < ApplicationController
  def new
  	@flight = Flight.find(params[:flight_id])
  	@seats = params[:num_tickets].to_i
  	@booking = Booking.new
  	@seats.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Flight booked!"
      redirect_to @booking
    else 
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end

end
