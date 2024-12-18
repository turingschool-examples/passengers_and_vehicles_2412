# lib/vehicle.rb

class Vehicle
  attr_reader :year, :make, :model, :passengers

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @passengers = []
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    @passengers.count(&:adult?)
  end
end
