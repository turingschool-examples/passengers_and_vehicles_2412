class Park
  attr_reader :name, :price, :vehicles

  def initialize(name, price)
    @name = name
    @price = price
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    passengers_array = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        passengers_array << passenger
      end
    end
    return passengers_array
  end

  def revenue
    total_revenue = 0
    passengers.each do |passenger|
      if passenger.adult? == true
        total_revenue += @price
      end
    end
    return total_revenue
  end
end