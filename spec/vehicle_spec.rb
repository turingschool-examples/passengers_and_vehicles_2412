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

    describe "passengers" do
        it "can have passengers" do
            expect(@vehicle.passengers).to eq([])
        end

        it "can add passengers" do
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20})
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})

            @vehicle.add_passenger(charlie)
            @vehicle.add_passenger(jude)
            @vehicle.add_passenger(taylor)

            expect(@vehicle.passengers).to eq([charlie, jude, taylor])
        end
    end
end