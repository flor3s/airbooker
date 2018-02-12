module FlightsHelper

	def search_flights(origin, destination, departure_time)
		Flight.where(origin: 				 origin, 
  							 destination: 	 destination,
  							 departure_time: date_range(departure_time)
  							)
	end

	def date_range(datestr)
		datetime = datestr.to_datetime
		datetime.beginning_of_day..datetime.end_of_day
	end
end