require 'pry'

class Park
  attr_reader :name, :price, :vehicles_in_park

  def initialize(name, price)
    @name = name
    @price = price.to_i         #Just to be sure it's an integer

    @vehicles_in_park = []
    @revenue = 0                #Assume e.g. this tracks annual revenue, starts at zero for year
  end

  def add_vehicle(incoming_vehicle)
    #This method assumes that by 'adding' the vehicle, it is entering the park and being charged;
    #and so the passegers must (and do) pay the entrance fee
    #Alternate: don't use instance var @revenue, just deduce from # vehicles in park (but risky - vehicles could leave, so need history)
    @revenue += calculate_entrance_fee(incoming_vehicle)
    @vehicles_in_park << incoming_vehicle
  end

  #Later: might want to provide a printing service as well to list vehicles on terminal? (Check)
  #If so, make this a separate class?  Can call methods from other classes, then format and print accordingly (probably needs its own tests too, ugh)

  def list_passengers_in_park()
    passenger_list = []
    @vehicles_in_park.each do |vehicle|
      passenger_list << vehicle.passengers
    end
    # binding.pry

    passenger_list.flatten
  end

  def calculate_entrance_fee(vehicle)
    vehicle.passengers.count * @price
  end

  def revenue_generated()
    #Trivial var return, due to implementation of add_vehicle()
    @revenue
  end

  def vehicles()
    #To be compliant with instructions' naming scheme
    @vehicles_in_park
  end

  def patron_names()
    #List all patrons' names in the park (assuming only passengers in vehicles to keep this simple)
    #Sorted alphabetically

    # passenger_list = list_passengers_in_park()
    # binding.pry

    # list_passengers_in_park.name.sort_by { |passenger| passenger.name }
    list_passengers_in_park.sort_by do |passenger|
      passenger.name
    end.map do |passenger_sorted|
      passenger_sorted.name
    end
  end

  def adults()
    list_passengers_in_park.find_all do |passenger|
      passenger.adult?()
    end.sort_by do |adult|
      adult.name
    end.map do |adult_sorted|
      adult_sorted.name
    end
  end

  def minors()
    #Same song and dance as for adults() - it is actually the negated set of adults, which would save computation time to store in a 2D array...
    list_passengers_in_park.find_all do |passenger|
      !passenger.adult?()
    end.sort_by do |minor|
      minor.name
    end.map do |minor_sorted|
      minor_sorted.name
    end
  end

end
