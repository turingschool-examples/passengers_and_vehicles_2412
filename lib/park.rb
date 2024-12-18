require 'pry'

class Park
  attr_reader :name, :price, :vehicles_in_park

  def initialize(name, price)
    @name = name
    @price = price.to_i         #Just to be sure it's an integer

    @vehicles_in_park = []
  end

  def add_vehicle(incoming_vehicle)
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

end
