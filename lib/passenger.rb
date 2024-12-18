# Use TDD to create a Passenger class that responds to the following interaction pattern.
# For the adult? method, a Passenger is considered an adult if they are age 18 or older.

require './lib/passenger'
require 'pry'


class Passenger
  attr_reader :name, :age, :driver #symbols used to create instance variables and methods

  def initialize(details) #initialize method takes in a hash argument
    @name = details["name"]
    #@name is 
    #= is the assignment operator
    #[] is used to access the value of a key in a hash
    #["name"] is the key we are accessing from the hash - ["parameter/argument"]
    @age = details["age"]
    @driver = false #default value for driver is false
  end

  def adult?
    @age >= 18 #if age is greater than or equal to 18, return true
  end

  def driver? #method to check if passenger is a driver
    @driver
  end

  def drive #method to change driver status to true
    @driver = true
  end
end


