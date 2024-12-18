require './spec/spec_helper.rb'

# attr_reader and initialize park name and ticket price
# add a vehicle to ann array for the instance of that park
#             -add_vehicle(course)
#             -vehicles = []


RSpec.describe Park do
  before(:each) do
    @park_1 = Park.new('Jackson Hole', 10)


    @vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    @vehicle_2 = Vehicle.new("1955", "VW", 'Beetle')
    @patrick = Passenger.new({'name' => 'Patrick', 'age' => 24})

    @vehicle_1.add_passenger(@charlie)
    @vehicle_1.add_passenger(@jude)
    @vehicle_1.add_passenger(@taylor)
    
    @vehicle_2.add_passenger(@patrick)
  end
  
  describe 'initialize' do
    it 'exists' do
      expect(@park_1).to be_an_instance_of(Park)
    end

    it 'has name' do
      expect(@park_1.name).to eq('Jackson Hole')
    end

    it 'has ticket price' do
      expect(@park_1.price).to eq(10)
    end
  end

  describe 'vehicles entry to park' do 
    it 'adds vehicles to an array' do
      expect(@park_1.vehicles).to eq([])

      @park_1.add_vehicle(@vehicle_1)
      @park_1.add_vehicle(@vehicle_2)

      expect(@park_1.vehicles).to eq([@vehicle_1, @vehicle_2])
    end  
  end

  describe 'adding to the park passengers' do
    before(:each) do
      @park_1.add_vehicle(@vehicle_1)
    end

    it 'can add passengers' do
      expect(@park_1.passengers).to eq([@charlie, @jude, @taylor])

      @park_1.add_vehicle(@vehicle_2)

      expect(@park_1.passengers).to eq([@charlie, @jude, @taylor, @patrick])
    end
  end

end
