

class Park 
  attr_reader :name, 
              :price,
              :vehicles,
              :passengers,
              :revenue


  def initialize(name, price)
    @name = name
    @price = price
    @vehicles = []
    @passengers = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
    vehicle.passengers.each { |passenger| @passengers << passenger }
  end

  def revenue
    @revenue = @passengers.count * @price
  end

  

end