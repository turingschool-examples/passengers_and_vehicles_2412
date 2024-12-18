require './lib/park'
require './lib/vehicle'
require './lib/passenger'
require 'RSpec'

RSpec.describe Park do
    before(:each)do
        @park = Park.new("Zion National Park", 50)
        @vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
        
    end
    it "the park exists" do
        expect(@park.name).to eq("Zion National Park")
        expect(@park.price).to eq(50)
    end
    it 'can add vehicles' do
         @park.add_vehicle(@vehicle_1)
        
         expect(@park.vehicles).to include(@vehicle_1)
    end

end
