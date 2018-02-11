Airport.create!(name: "JFK")
Airport.create!(name: "LAX")
Airport.create!(name: "ATL")
Airport.create!(name: "PDX")
Airport.create!(name: "DFW")

# flights
30.times do
	departure_time = Time.now + rand(7776000)
	duration = rand(1..4)
	random_airports = Array.new(10) { rand(1..5) }.uniq
	origin = random_airports.first
	destination = random_airports.second
	Flight.create!(departure_time: departure_time, 
								 duration: duration, 
								 origin_id: origin,
								 destination_id: destination)
end 