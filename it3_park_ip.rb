# This will execute all commands in the it3_park_ip.rb file sequentially.
# By default, if any error occurs, the script will stop execution at that line, 
# and Pry will return to the REPL, allowing you to debug interactively.

# Navigate to passengers and vehicles directory
# open pry
# load './it3_park_ip.rb'
# ==> true

require './lib/park'
require './lib/vehicle'
require './lib/passenger'

park = Park.new("Yellowstone", 20)
# => #<Park:0x00007fe0da9c63d8...>

park.name
# => "Yellowstone"

park.price
# => 20

park.vehicles
# => []

vehicle = Vehicle.new("2001", "Honda", "Civic")    
# => #<Vehicle:0x00007fe0da9c63d8...>

charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
# => #<Passenger:0x00007fe0da1ec450...>

jude = Passenger.new({"name" => "Jude", "age" => 20})    
# => #<Passenger:0x00007fe0da2730e0...>

taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
# => #<Passenger:0x00007fe0da2cf1b0...>

vehicle.add_passenger(charlie)    
vehicle.add_passenger(jude)    
vehicle.add_passenger(taylor)    

park.add_vehicle(vehicle)

park.vehicles
# => [#<Vehicle:0x00007fe0da9c63d8...>]

park.passengers
# => [#<Passenger:0x00007fe0da1ec450...>, #<Passenger:0x00007fe0da2730e0...>, #<Passenger:0x00007fe0da2cf1b0...>]

park.revenue
# => 40 (2 adults * $20)


