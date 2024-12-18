class Passenger
  attr_reader :name, :age

  def initialize(passenger_data)
    @name = passenger_data["name"]
    @age = passenger_data["age"]

    @is_driver = false
  end

  def adult?()
    @age >= 18
  end

  def driver?()
    @is_driver
  end

  def drive()
    @is_driver = true
  end
end
