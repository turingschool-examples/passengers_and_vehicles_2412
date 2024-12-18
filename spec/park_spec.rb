require './lib/park'
require './lib/passenger'
require './lib/vehicle'

RSpec.describe Park do
    before(:each) do
        @park = Park.new("Park1", 15)
    end

    describe "Initialize" do
        it "can create a park" do
            expect(@park).to be_a(Park)
            expect(@park.name).to eq("Park1")
            expect(@park.price).to eq(15)
        end
    end

    describe "Vehicles" do
        it "can hold vehicles" do
            expect(@park.vehicles).to eq([])
        end

        it "can add vehicles to the park" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")

            expect(@park.add_vehicle(vehicle)).to eq([vehicle])
            expect(@park.vehicles).to eq([vehicle])
        end
    end

    describe "passengers" do
        it "can list all passengers in the park" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")

            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20})
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})

            vehicle.add_passenger(charlie)
            vehicle.add_passenger(jude)
            vehicle.add_passenger(taylor)

            @park.add_vehicle(vehicle)
            
            expect(@park.passengers).to eq([charlie,jude,taylor])
        end

        it "can list patrons names" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")

            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20})
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})

            vehicle.add_passenger(charlie)
            vehicle.add_passenger(jude)
            vehicle.add_passenger(taylor)

            @park.add_vehicle(vehicle)

            expect(@park.patron_names).to eq(["Charlie","Jude","Taylor"])
        end

        it "can list all minors in the park" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")

            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20})
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})

            vehicle.add_passenger(charlie)
            vehicle.add_passenger(jude)
            vehicle.add_passenger(taylor)

            @park.add_vehicle(vehicle)

            expect(@park.minors).to eq(["Taylor"])
        end
    end

    describe "revenue" do
        it "can determine its revenue" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")

            charlie = Passenger.new({"name" => "Charlie", "age" => 18})
            jude = Passenger.new({"name" => "Jude", "age" => 20})
            taylor = Passenger.new({"name" => "Taylor", "age" => 12})

            vehicle.add_passenger(charlie)
            vehicle.add_passenger(jude)
            vehicle.add_passenger(taylor)

            @park.add_vehicle(vehicle)

            expect(@park.revenue).to eq(30)
        end
    end
end