# This will execute all commands in the passenger.rb file sequentially.
# By default, if any error occurs, the script will stop execution at that line, 
# and Pry will return to the REPL, allowing you to debug interactively.

# Navigate to passengers and vehicles directory
# open pry
# load './it1_passenger_ip.rb'
# ==> true

require './lib/passenger'
# => true

charlie = Passenger.new({"name" => "Charlie", "age" => 18})
# => #<Passenger:0x00007fe0da2cf1b0...>

taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
# => #<Passenger:0x00007fe0da2cf1b0...>

charlie.name
# => "Charlie"

charlie.age
# => 18

charlie.adult?
# => true

taylor.adult?
# => false

charlie.driver?
# => false

charlie.drive

charlie.driver?
# => true


