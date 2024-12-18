require 'pry' #pry is a runtime developer console and IRB alternative with powerful introspection capabilities.

class Park
  attr_reader :name, :price, :vehicles 
  #access to symbols name, price, vehicles

  def initialize(name, price) #1 #initialize is a method that is called when an object is created
    @name = name
    #@name is an instance variable
    #= is an assignment operator
    #name is a parameter
    @price = price
    @vehicles = [] #3 #empty array
  end

  def add_vehicle(vehicle) #2 #shovel operator
    @vehicles << vehicle
  end

  def passengers #4 #method to return all passengers
    all_passengers = [] #empty array
    @vehicles.each do |vehicle| #iterate through vehicles #|vehicle| is a block variable
      all_passengers.concat(vehicle.passengers)
      #concat is a method that adds the elements of an array to another array
      #(appends the elements of other_ary to self)
      #vehicle.passengers is an array of passengers
    end
    all_passengers #return all_passengers array after iteration
    

  end

  def revenue #5 #method to calculate revenue
    adult_passenger_count = 0 #initialize adult_passenger_count to 0
    passengers.each do |passenger| #iterate through passengers
      adult_passenger_count += 1 if passenger.adult? #increment adult_passenger_count if passenger is an adult
    end
    adult_passenger_count * @price #return adult_passenger_count multiplied by price
  end
end

#to check for return value data type

# park.name.class       # => String
# park.price.class      # => Integer
# park.vehicles.class   # => Array
# park.add_vehicle(Vehicle.new).class  # => Array
# park.passengers.class # => Array
# park.revenue.class    # => Integer

