class Passenger
  attr_reader :name, :age

  def initialize(passenger_attributes)
    @name = passenger_attributes["name"]
    @age = passenger_attributes["age"]

  end

  def adult?
    @age >= 18
  end
end