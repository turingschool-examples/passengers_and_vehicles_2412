require './lib/passenger'
require './lib/vehicle'
require './lib/park'
require 'rspec'

describe Park do
  before do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    
    @honda = Vehicle.new("2001", "Honda", "Civic")
    @honda.add_passenger(@charlie)
    @honda.add_passenger(@jude)
    @honda.add_passenger(@taylor)

    @wilson = Passenger.new({"name" => "Wilson", "age" => 38})
    @debbie = Passenger.new({"name" => "Debbie", "age" => 36})

    @toyota = Vehicle.new("2015", "Toyota", "4Runner")
    @toyota.add_passenger(@wilson)
    @toyota.add_passenger(@debbie)

    @rick = Passenger.new({"name" => "Rick", "age" => 45})
  
    @hyundai = Vehicle.new("2008", "Hyundai", "Sonata")
    @hyundai.add_passenger(@rick)

    @fester = Passenger.new({"name" => "Charlie", "age" => 63})
    @wednesday = Passenger.new({"name" => "Wednesday", "age" => 14})
    @pugsley = Passenger.new({"name" => "Pugsley", "age" => 13})

    @ford = Vehicle.new("1951", "Ford", "Model T")
    @ford.add_passenger(@fester)
    @ford.add_passenger(@wednesday)
    @ford.add_passenger(@pugsley)

    @yellowstone = Park.new("Yellowstone", 30)
    @sequoia = Park.new("Sequoia", 20)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@yellowstone).to be_a(Park)
    end

    it 'has a name' do
      
    end

    it 'has a price' do
      
    end

    it 'starts with an empty list of vehicles' do
      
    end

    it 'starts with an empty list of passengers' do
      
    end

  end

  describe '#add_vehicle' do
    it 'can add a vehicle to the park' do
      
    end

    it 'can list all the vehicles that entered the park' do
      
    end

    it 'can list all the passengers that entered the park' do
      
    end
  end

  describe '#revenue' do
    it 'can calculate revenue generated' do
      
    end
  end

  describe '#patron_names' do
    it 'can provide an alphabetical list of patron names' do
      
    end
  end

  describe '#minors' do
    it 'can provide an alphabetical list of all minors' do
      
    end
  end

  describe '#adults' do
    it 'can provide an alphabetical list of all adults' do
      
    end
  end

end