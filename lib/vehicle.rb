#Use TDD to create a Vehicle class that responds to the following interaction pattern:

class Vehicle
  attr_reader :make, :model, :year, :passengers, :speed

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    @passengers = []
    @speed = 0
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    @passengers.count { |passenger| passenger.adult? }
  end

  def speed_up(amount)
    @speed += amount
  end

  def speeding?
    @speed > 60
  end
end