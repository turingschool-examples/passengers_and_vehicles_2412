require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
    end

    describe "initialize" do
        it "can create a vehicle" do

            expect(@vehicle).to be_a(Vehicle)
            expect(@vehicle.year).to eq("2001")
            expect(@vehicle.make).to eq("Honda")
            expect(@vehicle.model).to eq("Civic")
        end
    end

    describe "speed" do
        it "can determine if it is speeding" do
            expect(@vehicle.speeding?).to eq(false)
        end

        it "can speed" do
            @vehicle.speed

            expect(@vehicle.speeding?).to eq(true)
        end
    end
end