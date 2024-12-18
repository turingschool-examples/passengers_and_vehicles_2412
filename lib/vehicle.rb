# lib/vehicle.rb

# The Vehicle class represents a car with passengers.
class Vehicle
  attr_reader :year, :make, :model, :passengers

  # Initializes a Vehicle with its year, make, and model.
  def initialize(year, make, model)
    @year = year            # The year the vehicle was manufactured.
    @make = make            # The vehicle's make (e.g., Honda).
    @model = model          # The vehicle's model (e.g., Civic).
    @passengers = []        # A list to store passengers in the vehicle.
  end

  # Adds a passenger to the vehicle.
  def add_passenger(passenger)
    @passengers << passenger
  end

  # Counts the number of adult passengers in the vehicle.
  def num_adults
    @passengers.count(&:adult?) # Use `adult?` to count passengers who are adults.
  end
end
