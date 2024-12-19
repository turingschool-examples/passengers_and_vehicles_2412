

class Park 
  attr_reader :name, 
              :price,
              :vehicles,
              :passengers,
              :revenue,
              :patron_name


  def initialize(name, price)
    @name = name
    @price = price
    @vehicles = []
    @passengers = []
    @patron_name = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
    vehicle.passengers.each { |passenger| @passengers << passenger }
  end

  def revenue
    @revenue = @passengers.count * @price
  end

  def patron_name
    @patron_name = @passengers.map{|x| x.name}
  end

  def minors
    minors = @passengers.select {|age| !age.adult?}
    return minors
  end

  def adults
   adults = @passengers.select {|age| age.adult?}
   return adults
  end

end