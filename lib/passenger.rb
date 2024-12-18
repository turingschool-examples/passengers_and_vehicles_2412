

class Passenger
  attr_reader :name,
              :age,
              :driver

  def initialize(passenger_info)
    @name = passenger_info['name']
    @age = passenger_info['age']
    @driver = false
  end

  def adult?
    @age >= 18 ? true : false
  end

  def driver?
    return @driver
  end

  def drive
    @age >= 16 ? @driver = true : @driver = false
  end
end