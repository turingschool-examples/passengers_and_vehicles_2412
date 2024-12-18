require './lib/passenger'
require './lib/vehicle'
require 'rspec'

describe Vehicle do
  before do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")

    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@vehicle).to be_a(Vehicle)
    end

    it 'has a year' do
      expect(@vehicle.year).to eq("2001")
    end

    it 'has a make' do
      expect(@vehicle.make).to eq("Honda")
    end

    it 'has a model' do
      expect(@vehicle.model).to eq("Civic")
    end

    it 'starts with no passengers' do
      expect(@vehicle.passengers).to eq([])
    end
  end

  describe '#speeding?' do
    it 'can check whether a vehicle is speeding' do
      expect(@vehicle.speeding?).to eq(false)
    end
  end

  describe '#speed' do
    it 'can make a vehicle start speeding' do
      expect(@vehicle.speeding?).to eq(false)

      @vehicle.speed

      expect(@vehicle.speeding?).to eq(true)
    end
  end

  describe '#add_passenger' do
    it 'can add passengers to a vehicle' do
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@jude)
      @vehicle.add_passenger(@taylor)

      expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end
  end

  describe '#num_adults' do
    it 'can track number of adults in a vehicle' do
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@jude)
      @vehicle.add_passenger(@taylor)

      expect(@charlie.adult?).to eq(true)
      expect(@jude.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)

      expect(@vehicle.num_adults).to eq(2)
    end
  end

end