require 'rspec'
require './lib/vehicle'
require './lib/passenger'

#to run tests, type rspec spec/vehicle_spec.rb in the terminal

RSpec.describe Vehicle do
  describe '#initialize' do
    it 'creates a vehicle with a default speed of 0' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)

      expect(vehicle.speed).to eq(0)
    end

    it 'has attributes' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      expect(vehicle.make).to eq("Toyota")
      expect(vehicle.model).to eq("Camry")
      expect(vehicle.year).to eq(2020)
    end
  end

  describe '#speeding?' do
    it 'returns false by default' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)

      expect(vehicle.speeding?).to be false
    end

    it 'returns true if the vehicle is speeding' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      vehicle.speed_up(70)

      expect(vehicle.speeding?).to be true
    end
  end

  describe '#add_passenger' do
    it 'can add passengers' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      passenger = Passenger.new({"name" => "John Doe", "age" => 30})
      vehicle.add_passenger(passenger)
      expect(vehicle.passengers).to include(passenger)
    end

    it 'can count number of adults' do
      vehicle = Vehicle.new("Toyota", "Camry", 2020)
      passenger1 = Passenger.new({"name" => "John Doe", "age" => 30})
      passenger2 = Passenger.new({"name" => "Jane Doe", "age" => 17})
      vehicle.add_passenger(passenger1)
      vehicle.add_passenger(passenger2)
      expect(vehicle.num_adults).to eq(1)
    end
  end
end