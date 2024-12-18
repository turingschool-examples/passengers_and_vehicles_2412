# lib/passenger.rb

class Passenger
  attr_reader :name, :age

  # Initialize a Passenger with a hash containing name and age
  def initialize(details)
    @name = details["name"]
    @age = details["age"]
    @driver = false # Default driver status is false
  end

  # Returns true if the passenger is 18 or older
  def adult?
    @age >= 18
  end

  # Returns the current driver status
  def driver?
    @driver
  end

  # Updates the driver status to true
  def drive
    @driver = true
  end
end

