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

    @lamar = Passenger.new({"name" => "Lamar", "age" => 38})
    @debbie = Passenger.new({"name" => "Debbie", "age" => 36})

    @toyota = Vehicle.new("2015", "Toyota", "4Runner")
    @toyota.add_passenger(@lamar)
    @toyota.add_passenger(@debbie)

    @rick = Passenger.new({"name" => "Rick", "age" => 45})
  
    @hyundai = Vehicle.new("2008", "Hyundai", "Sonata")
    @hyundai.add_passenger(@rick)

    @fester = Passenger.new({"name" => "Fester", "age" => 63})
    @wednesday = Passenger.new({"name" => "Wednesday", "age" => 14})
    @pugsley = Passenger.new({"name" => "Pugsley", "age" => 13})

    @ford = Vehicle.new("1951", "Ford", "Model T")
    @ford.add_passenger(@fester)
    @ford.add_passenger(@wednesday)
    @ford.add_passenger(@pugsley)

    @yellowstone = Park.new("Yellowstone", 30)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@yellowstone).to be_a(Park)
    end

    it 'has a name' do
      expect(@yellowstone.name).to eq("Yellowstone")
    end

    it 'has a price' do
      expect(@yellowstone.price).to eq(30)
    end

    it 'starts with an empty list of vehicles' do
      expect(@yellowstone.vehicles).to eq([])
    end

    it 'starts with an empty list of passengers' do
      expect(@yellowstone.passengers).to eq([])
    end

  end

  describe '#add_vehicle' do
    it 'can add a vehicle to the park' do
      expect(@yellowstone.add_vehicle(@honda)).to eq([@honda])
    end

    it 'can list all the vehicles that entered the park' do
      @yellowstone.add_vehicle(@honda)
      @yellowstone.add_vehicle(@toyota)
      @yellowstone.add_vehicle(@hyundai)
      @yellowstone.add_vehicle(@ford)
      expect(@yellowstone.vehicles).to eq([@honda, @toyota, @hyundai, @ford])
    end

    it 'can list all the passengers that entered the park' do
      @yellowstone.add_vehicle(@honda)
      @yellowstone.add_vehicle(@toyota)
      expect(@yellowstone.passengers).to eq([@charlie, @jude, @taylor, @lamar, @debbie])
    end
  end

  describe '#revenue' do
    it 'can calculate revenue generated' do
      @yellowstone.add_vehicle(@honda)
      @yellowstone.add_vehicle(@toyota)
      @yellowstone.add_vehicle(@hyundai)
      @yellowstone.add_vehicle(@ford)

      expect(@yellowstone.price).to eq(30)
      expect(@yellowstone.adults.length).to eq(6)

      expect(@yellowstone.revenue).to eq(180)
    end
  end

  describe '#patron_names' do
    it 'can provide an alphabetical list of patron names' do
      @yellowstone.add_vehicle(@honda)
      @yellowstone.add_vehicle(@toyota)
      @yellowstone.add_vehicle(@hyundai)
      @yellowstone.add_vehicle(@ford)

      expect(@yellowstone.patron_names).to eq(["Charlie", "Debbie", "Fester", "Jude", "Lamar", "Pugsley", "Rick", "Taylor", "Wednesday"])
    end
  end

  describe '#minors' do
    it 'can provide an alphabetical list of all minors' do
      @yellowstone.add_vehicle(@honda)
      @yellowstone.add_vehicle(@toyota)
      @yellowstone.add_vehicle(@hyundai)
      @yellowstone.add_vehicle(@ford)

      expect(@yellowstone.minors).to eq(["Pugsley", "Taylor", "Wednesday"])
    end
  end

  describe '#adults' do
    it 'can provide an alphabetical list of all adults' do
      @yellowstone.add_vehicle(@honda)
      @yellowstone.add_vehicle(@toyota)
      @yellowstone.add_vehicle(@hyundai)
      @yellowstone.add_vehicle(@ford)
      
      expect(@yellowstone.adults).to eq(["Charlie", "Debbie", "Fester", "Jude", "Lamar", "Rick"])
    end
  end

end