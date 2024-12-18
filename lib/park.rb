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
    #This method assumes that by 'adding' the vehicle, it is entering the park and being charged, and so the passegers pay the entrance fee
    #Alternate: don't use instance var @revenue, just deduce from # vehicles in park (but risky - vehicles could leave, so need history)
    @revenue += calculate_entrance_fee(incoming_vehicle)
    @vehicles_in_park << incoming_vehicle
  end

  def passengers()
    passenger_list = []
    @vehicles_in_park.each do |vehicle|
      passenger_list << vehicle.passengers
    end
    #Since this is a 2D array (vehicles) of arrays (passengers), need to flatten it to 1D:
    passenger_list.flatten
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
    #NOTE: could write a separate method to just sort patrons as a full array, since 3 methods kidna rely on this...
    #Written at bottom of class
    passengers.sort_by do |passenger|
      passenger.name
    end.map do |passenger_sorted|
      passenger_sorted.name
    end
  end

  def adults()
    #Final all adult passengers, then sort by their names, then map to an array with just their names
    # passengers.find_all do |passenger|
    #   passenger.adult?()
    # end.sort_by do |adult|
    #   adult.name
    # end.map do |adult_sorted|
    #   adult_sorted.name
    # end

    #Refactored after turning in:
    sorted_passengers().find_all do |passenger_sorted|
      passenger_sorted.adult?()
    end.map do |adult_sorted|
      adult_sorted.name
    end
  end

  def minors()
    #Same song and dance as for adults() - it is actually the negated set of adults (in another implementation this could save computational time)
    # passengers.find_all do |passenger|
    #   !passenger.adult?()
    # end.sort_by do |minor|
    #   minor.name
    # end.map do |minor_sorted|
    #   minor_sorted.name
    # end

    sorted_passengers().find_all do |passenger_sorted|
      !passenger_sorted.adult?()
    end.map do |minor_sorted|
      minor_sorted.name
    end
  end

  private
  
  #Anything defined below here will be private.  NEET!

  def sorted_passengers()
    #Built after I turned in.
    passengers().sort_by do |passenger|
      passenger.name
    end
  end

  #Could move entrance_fees() here!
  def calculate_entrance_fee(vehicle)
    # vehicle.passengers.length * @price

    #Ah crap, I accidentally charged the same fee for all people (not just adults)
    #Here is the modified version:
    vehicle.num_adults() * @price
  end

  #Some other time: might want to provide a printing service as well to list various queries on the terminal.
  #If so, make this a separate class maybe?  Can call methods from e.g. Park class wherever, then format and print accordingly (probably needs its own tests too, ugh)

end
