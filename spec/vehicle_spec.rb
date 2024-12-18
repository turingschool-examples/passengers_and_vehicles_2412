require 'rspec'
require './lib/vehicle'
require './lib/passenger'

# to run RSPEC
# navigate to passengers_and_vehicles_2412 directory
# rspec spec/vehicle_spec.rb in the terminal

RSpec.describe Vehicle do #Vehicle is the class being tested for initialization
  describe '#initialize' do
    it 'creates a vehicle with a default speed of 0' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      #vehicle is an instance of the Vehicle class
      #= is an assignment operator
      #Vehicle is the class
      #.new is a class method
      #("Toyota", "Camry", 2020) are the arguments - make, model, year
      expect(vehicle.speed).to eq(0)
    end

    it 'has attributes' do  #test to check if the vehicle has attributes
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      expect(vehicle.make).to eq("Toyota")
      expect(vehicle.model).to eq("Camry")
      expect(vehicle.year).to eq(2020)
    end
  end

  describe '#speeding?' do #test to check if the vehicle is speeding
    it 'returns false by default' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)

      expect(vehicle.speeding?).to be false #because the speed is 0 by default
    end

    it 'returns true if the vehicle is speeding' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      vehicle.speed_up(70)

      expect(vehicle.speeding?).to be true #because the speed is greater than 60 with the input of (70)
    end
  end

  describe '#add_passenger' do #test to check if the passenger can be added to the vehicle
    it 'can add passengers' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      passenger = Passenger.new({"name" => "John Doe", "age" => 30})
      vehicle.add_passenger(passenger) #(argument is the passenger)
      expect(vehicle.passengers).to include(passenger)
      #expect is a method that takes an argument
      #() argument is the vehicle.passengers
      #vehicle is the instance of the Vehicle class
      #.passengers is the attribute of the vehicle
      #.include is a method that takes the argument of the (passenger)
    end

    it 'can count number of adults' do #test to check if the number of adults can be counted
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      passenger1 = Passenger.new({"name" => "John Doe", "age" => 30})
      passenger2 = Passenger.new({"name" => "Jane Doe", "age" => 17})
      vehicle.add_passenger(passenger1)
      vehicle.add_passenger(passenger2)
      expect(vehicle.num_adults).to eq(1)
    end
  end
end

