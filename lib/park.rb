

class Park 
  attr_reader :name, 
              :price,
              :vehicles,
              :passengers,


  def initialize(name, price)
    @name = name
    @price = price
    @vehicles = []
    @passengers = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
    list_class = @vehicles.each {|x| x.passengers}
    passenger_list = list_class.flat_map {|y| y.passengers}
    passenger_list.each {|passenger| @passengers << passenger}
  end

  def revenue


  end

end