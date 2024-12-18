require './spec/spec_helper.rb'

RSpec.describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe 'initialize' do
    it 'exists' do
      expect(@vehicle).to be_an_instance_of(Vehicle)
    end

    it 'has vehicle info' do
      expect(@vehicle.year).to eq('2001')
    end

    it 'has a make' do
      expect(@vehicle.make).to eq('Honda')
    end

    it 'has a model' do
      expect(@vehicle.model).to eq('Civic')
    end
  end

  describe 'methods' do
    it 'is speeding' do
      expect(@vehicle.speeding?).to eq(false)

      @vehicle.speed

      expect(@vehicle.speeding?).to eq(true)
    end

    it 'adds passengers' do
      expect(@vehicle.passengers).to eq([])

      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@jude)
      @vehicle.add_passenger(@taylor)
      
      expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end
  end
end