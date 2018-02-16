class FlightsController < ApplicationController
  
  def index
  	@airport_options = Airport.all.map { |a| [a.name, a.id] }
  	@date_options = Flight.all.order('departure_time ASC').map { |d| d.formatted_date }.uniq
  	@ticket_options = [["1", 1], ["2", 2], ["3", 3], ["4", 4]]
  	@found_flights = found_flights if params[:commit]
  end

  private
  	def flight_params
  		params.permit(:origin, :destination, :departure_time, :num_tickets)
  	end

  	def found_flights
  		search_flights(params[:origin], params[:destination], params[:departure_time])
  	end
end