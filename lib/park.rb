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
    course.passengers.each {|passenger|
      @passengers << passenger  
    }
    return @vehicles
  end

  def revenue
    return (price * (@passengers.select{|passenger| passenger.adult?}.length))
  end

  def patron_names
    return @passengers.map{|passenger| passenger.name}.sort
  end

  def minors
    minors = @passengers.select{|passenger| passenger.adult? == false}
    return minors.map{|minor| minor.name}.sort
  end
  
  def adults
    adults = @passengers.select{|passenger| passenger.adult?}
    return adults.map{|adult| adult.name}.sort
  end

end