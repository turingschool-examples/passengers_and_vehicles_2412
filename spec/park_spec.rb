require './lib/passenger'
require './lib/vehicle'
require './lib/park'


RSpec.describe Park do
  before(:each)do
    @kennywood = Park.new("Kennywood", 10)
    @vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle_2 = Vehicle.new("2015", "Subaru", "Forrester")
    @coral = Passenger.new({name: 'Coral', age: 29})
    @jonah = Passenger.new({name: 'Jonah', age: 6})
    @charlie = Passenger.new({name: 'Charlie', age: 18})
    @jude = Passenger.new({name: 'Jude', age: 20})
    @taylor = Passenger.new({name: 'Taylor', age: 12})
  end

  describe "#initialization" do 
    it "exists" do   
      expect(@kennywood).to be_a Park
    end
    it "has a name" do
      expect(@kennywood.name).to eq('Kennywood')
    end

    it "has a price" do
      expect(@kennywood.price).to eq(10)
    end
  end

  describe "#vehicles" do
    it "defaults an empty array" do
      expect(@kennywood.vehicles).to eq([])
    end

    it "can add a vehicle to array" do
      @kennywood.add_vehicle(@vehicle_1)

      expect(@kennywood.vehicles).to eq([@vehicle_1])
    end

    it "can add multiple vehicles to array" do
      @kennywood.add_vehicle(@vehicle_1)
      @kennywood.add_vehicle(@vehicle_2)

      expect(@kennywood.vehicles).to eq([@vehicle_1, @vehicle_2])
    end
  end

  describe "#passengers" do
    it "can create array of passengers from multiple vehicles" do
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@jude)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_2.add_passenger(@coral)
      @vehicle_2.add_passenger(@jonah)

      @kennywood.add_vehicle(@vehicle_1)
      @kennywood.add_vehicle(@vehicle_2)

      expect(@kennywood.passengers).to eq([@charlie, @jude, @taylor, @coral, @jonah])
    end
  end
  
  describe "#revenue" do
    it "can accurately calculate revenue collected from all adults" do
      @vehicle_1.add_passenger(@charlie)
      @vehicle_1.add_passenger(@jude)
      @vehicle_1.add_passenger(@taylor)
      @vehicle_2.add_passenger(@coral)
      @vehicle_2.add_passenger(@jonah)

      @kennywood.add_vehicle(@vehicle_1)
      @kennywood.add_vehicle(@vehicle_2)

      expect(@kennywood.revenue).to eq(30)
    end
  end

end