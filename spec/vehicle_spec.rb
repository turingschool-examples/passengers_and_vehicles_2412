require './lib/vehicle'
require './lib/passenger'

RSpec.describe do 
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
    end

    describe '#initalize' do
        it "can initalize" do
            expect(@vehicle).to be_an_instance_of(Vehicle)
            expect(@vehicle.year).to eq("2001")
            expect(@vehicle.make).to eq("Honda")
            expect(@vehicle.model).to eq("Civic")
        end 
    end

    describe '#speeding?' do
        it "checks if vehicle is speeding" do
            expect(@vehicle.speeding?).to eq(false)

            @vehicle.speed

            expect(@vehicle.speeding?).to eq(true)
        end
    end

    describe '#passengers' do
        it "has passengers in the car" do
            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20})
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})

            @vehicle.add_passenger(charlie)
            @vehicle.add_passenger(jude)
            @vehicle.add_passenger(taylor)

            expect(@vehicle.passengers).to be_a(Array)
            expect(@vehicle.num_adults).to eq(2)
        end
    end
end