#Use TDD to create a Vehicle class that responds to the following interaction pattern:

class Vehicle
  attr_reader :make, :model, :year, :passengers, :speed 
  #makes the instance variables @make, @model, @year, @passengers, @speed readable outside the class - 
  #:make, :model, :year, :passengers, :speed are symbols

  def initialize(make, model, year) #intialize method takes 3 arguments
    @make = make
    #@make instance variable is assigned the value of the make argument
    #= is an assignment operator
    #make is a local variable
    @model = model
    @year = year
    @passengers = [] #passengers is an empty array
    @speed = 0 #speed is assigned the value of 0
  end

  def add_passenger(passenger) #method to shovel passenger into the passengers array
    @passengers << passenger
  end

  def num_adults #method to count the number of adults in the passengers array
    count = 0 
    @passengers.each do |passenger| #iterates through the passengers array, |passenger| is a block variable
      count += 1 if passenger.adult? #if the passenger is an adult, count is incremented by 1
    end
    count #returns the count
  end

  def speed_up(amount) #method to increase the speed of the vehicle (amount is the argument)
    @speed += amount #@speed is incremented by the amount #+= is an assignment operator #amount is a local variable
  end

  def speeding? #method to check if the vehicle is speeding
    @speed > 60 #returns true if the speed is greater than 60, false otherwise
  end
end