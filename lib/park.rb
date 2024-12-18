class Park
attr_reader :name, :price, :vehicles, :passengers

  def initialize(name, price)
    @name = name
    @price = price
    @vehicles = []
    @passengers = []
  end 

  def add_vehicle(course)
    @vehicles << course
    @passengers << course.passengers.flatten
    return @vehicles
  end

  def revenue
    return (price * (@passengers.select{|passenger| passenger.adult?}))
  end

  def patron_names
    return @passengers.map{|passenger| passenger.name}.sort
  end

  def minors
    minors = @passengers.select{|passenger| passenger.adult?}
    return minors.map{|minor| minor.name}.sort
  end
  
  def adults
    adults = @passengers.select{|passenger| passenger.adult? == false}
    return adults.map{|adult| adult.name}.sort
  end

end