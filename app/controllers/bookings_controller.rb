class BookingsController < ApplicationController

  def new
  	@flight = Flight.find(params[:flight_id])
  	@seats = params[:num_tickets].to_i
  	@booking = Booking.new
  	@seats.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params.except(:num_tickets))
    if @booking.save
      @booking.passengers.each do |p|
        PassengerMailer.successful_booking(@passenger).deliver_now
      end
      flash[:success] = "Flight booked! Flight information has been sent to the given email(s)."
      redirect_to @booking
    else 
      @flight = Flight.find(booking_params[:flight_id])
      @seats = booking_params[:num_tickets].to_i
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, :num_tickets, passengers_attributes: [:id, :name, :email])
    end
end
