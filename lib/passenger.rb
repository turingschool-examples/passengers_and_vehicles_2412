# lib/passenger.rb

# The Passenger class represents a person in a vehicle.
class Passenger
  attr_reader :name, :age

  # Initializes a Passenger with their name and age.
  def initialize(details)
    @name = details["name"] # Passenger's name.
    @age = details["age"]   # Passenger's age.
    @driver = false         # Tracks if the passenger is a driver (default: false).
  end

  # Determines if the passenger is an adult (18 or older).
  def adult?
    @age >= 18
  end

  # Checks if the passenger is currently a driver.
  def driver?
    @driver
  end

  # Updates the passenger's status to a driver.
  def drive
    @driver = true
  end
end
