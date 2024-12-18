require 'pry'

class Park
  attr_reader :name, :price

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

  #Some other time: might want to provide a printing service as well to list vehicles on terminal.
  #If so, make this a separate class?  Can call methods from e.g. Park class wherever, then format and print accordingly (probably needs its own tests too, ugh)

  def passengers()
    passenger_list = []
    @vehicles_in_park.each do |vehicle|
      passenger_list << vehicle.passengers
    end
    #Since this is a 2D array (vehicles) of arrays (passengers), need to flatten it to 1D:
    passenger_list.flatten
  end

  def calculate_entrance_fee(vehicle)
    vehicle.passengers.length * @price
  end

  def revenue()
    #Trivial var return, due to implementation of add_vehicle()
    @revenue
  end

  def vehicles()
    #To be compliant with instructions' naming scheme
    @vehicles_in_park
  end

  def patron_names()
    #List all patrons' names in the park, sorted alphabetically
    passengers.sort_by do |passenger|
      passenger.name
    end.map do |passenger_sorted|
      passenger_sorted.name
    end
  end

  def adults()
    #Final all adult passengers, then sort by their names, then map to an array with just their names
    passengers.find_all do |passenger|
      passenger.adult?()
    end.sort_by do |adult|
      adult.name
    end.map do |adult_sorted|
      adult_sorted.name
    end
  end

  def minors()
    #Same song and dance as for adults() - it is actually the negated set of adults (in another implementation this could save computational time)
    passengers.find_all do |passenger|
      !passenger.adult?()
    end.sort_by do |minor|
      minor.name
    end.map do |minor_sorted|
      minor_sorted.name
    end
  end

end
