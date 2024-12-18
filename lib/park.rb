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
    all_passengers = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        all_passengers << passenger
      end
    end
    all_passengers
  end

  def revenue
    adults = passengers.select { |passenger| passenger.adult? }
    adults.count * @price
  end

  def vehicles_in_park
    @vehicles
  end

  def patron_names
    names = []
    passengers.each do |passenger|
      names << passenger.name
    end
    names.sort
  end

  
  def minors  
  minors = []
    passengers.each do |passenger|
      if passenger.age < 18
        minors << passenger.name
      end
    end
    minors.sort
  end

  
  def adults
    adults = []
    passengers.each do |passenger|
      if passenger.age >= 18
        adults << passenger.name
      end
    end
    adults.sort
  end
  
end