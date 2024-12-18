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

end
