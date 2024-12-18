require './spec/spec_helper.rb'

# attr_reader and initialize park name and ticket price
# 


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
end
