class Passenger
  attr_reader :name, :age


  def initialize(passenger_details)
    @name = passenger_details["name"]
    @age = passenger_details["age"]
    @drives = false
  end

  def adult?
    age >= 18 ? true : false
  end

  def driver?
    return @drives
  end

  def drive
    @drives = true
  end

end