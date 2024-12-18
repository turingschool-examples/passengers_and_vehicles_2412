class Passenger
  attr_reader :name, :age


  def initialize(passenger_details)
    @name = passenger_details["name"]
    @age = passenger_details["age"]
    @driver = false
  end

  def adult?
    age >= 18 ? true : false
  end

  def driver?
    return @driver
  end

  def drive
    @driver = true
  end

end