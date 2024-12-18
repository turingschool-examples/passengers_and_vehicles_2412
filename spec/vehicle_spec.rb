require './lib/passenger'
require './lib/vehicle'


RSpec.describe Vehicle do
  before(:each)do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({name: 'Charlie', age: 18})
    @jude = Passenger.new({name: 'Jude', age: 20})
    @taylor = Passenger.new({name: 'Taylor', age: 12})
  end

  describe "#initialization" do 
    it "exists" do   
      expect(@vehicle).to be_a Vehicle
    end

    it "has a year" do
      expect(@vehicle.year).to eq("2001")
    end

    it "has a make" do
      expect(@vehicle.make).to eq("Honda")
    end

    it "has a model" do
      expect(@vehicle.model).to eq("Civic")
    end
  end

  describe "speeding?" do
    it "verifies speeding default is false" do
      expect(@vehicle.speeding?).to eq(false)
    end

    it "changes speeding status" do
      expect(@vehicle.speeding?).to eq(false)
      @vehicle.speed
      expect(@vehicle.speeding?).to eq(true)
    end
  end

  describe "#passengers" do
    it "defaults to empty array" do
      expect(@vehicle.passengers).to eq([])
    end
    it "add_passengers adds passengers to array" do
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@jude)
      @vehicle.add_passenger(@taylor)
      expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end
  end

  describe "#num_adults" do
    it "counts number of adult passengers" do
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@jude)
      @vehicle.add_passenger(@taylor)

      expect(@vehicle.num_adults).to eq(2)
    end
  end
end