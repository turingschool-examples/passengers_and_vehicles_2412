require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe do
    before(:each) do
        @park = Park.new("Rocky Mountain National Park", 20)
    end

    describe '#initialize' do
        it "can initalize" do
            expect(@park).to be_an_instance_of(Park)
        end
    end

    describe "#add_vehicle" do
        it "a vehicle enters the park" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")
            
            @park.add_vehicle(vehicle)

            expect(@park.vehicles).to include(vehicle)
            expect(@park.vehicles).to be_an(Array)
            expect(@park.passengers).to be (Array)
        end
    end

end

