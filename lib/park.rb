require 'pry'

class Park
  attr_reader :name, :price, :vehicles

  def initialize(name, price) #1
    @name = name
    @price = price
    @vehicles = [] #3
  end

  def add_vehicle(vehicle) #2 
    @vehicles << vehicle
  end

  def passengers #4
    @vehicles.flat_map(&:passengers)
  end

  def revenue
    passengers.count { |passenger| passenger.adult? } * @price #5
  end
end

#to check for return value data type

# park.name.class       # => String
# park.price.class      # => Integer
# park.vehicles.class   # => Array
# park.add_vehicle(Vehicle.new).class  # => Array
# park.passengers.class # => Array
# park.revenue.class    # => Integer

