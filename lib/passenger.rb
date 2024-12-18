require './lib/passenger'
# Use TDD to create a Passenger class that responds to the following interaction pattern.
# For the adult? method, a Passenger is considered an adult if they are age 18 or older.

require './lib/passenger'
require 'pry'


class Passenger
  attr_reader :name, :age, :driver

  def initialize(details)
    @name = details["name"]
    @age = details["age"]
    @driver = false
  end

  def adult?
    @age >= 18
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end
end


