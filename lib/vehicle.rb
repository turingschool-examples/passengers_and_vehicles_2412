class Vehicle
  attr_reader :year, :make, :model, :passengers

  # Initialize a Vehicle with year, make, model, and an empty list of passengers.
  def initialize(year, make, model)
    @year = year         # The manufacturing year of the vehicle.
    @make = make         # The make (brand) of the vehicle, e.g., Honda.
    @model = model       # The specific model of the vehicle, e.g., Civic.
    @passengers = []     # An array to hold passengers.
  end

  # Add a passenger to the vehicle's passenger list.
  def add_passenger(passenger)
    @passengers << passenger
  end

  # Count the number of adult passengers in the vehicle.
  def num_adults
    @passengers.count { |passenger| passenger.adult? }
  end
end
