require './lib/park'
require './lib/vehicle'
require './lib/passenger'

# navigate to passengers_and_vehicles_2412 directory
# run rspec ./spec/park_spec.rb

RSpec.describe Park do
    before :each do
        @park = Park.new("Yellowstone", 10)
        @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
        @vehicle2 = Vehicle.new("2015", "Toyota", "Camry")
        @passenger1 = Passenger.new({"name" => "John Doe", "age" => 30})
        @passenger2 = Passenger.new({"name" => "Jane Doe", "age" => 20})
        @passenger3 = Passenger.new({"name" => "Jimmy Doe", "age" => 10})
    end

    describe '#initialize' do
        it 'creates a park with a name, price, and empty vehicles array' do
            expect(@park.name).to eq("Yellowstone")
            expect(@park.price).to eq(10)
            expect(@park.vehicles).to eq([])
        end
    end

    describe '#add_vehicle' do
        it 'adds a vehicle to the park' do
            @park.add_vehicle(@vehicle1)
            expect(@park.vehicles).to include(@vehicle1)
        end
    end

    describe '#passengers' do
        it 'returns a list of all passengers in the park' do
            @vehicle1.add_passenger(@passenger1)
            @vehicle1.add_passenger(@passenger2)
            @vehicle2.add_passenger(@passenger3)
            @park.add_vehicle(@vehicle1)
            @park.add_vehicle(@vehicle2)

            expect(@park.passengers).to include(@passenger1, @passenger2, @passenger3)
        end
    end

    describe '#revenue' do
        it 'calculates the total revenue from adult passengers' do
            @vehicle1.add_passenger(@passenger1)
            @vehicle1.add_passenger(@passenger2)
            @vehicle2.add_passenger(@passenger3)
            @park.add_vehicle(@vehicle1)
            @park.add_vehicle(@vehicle2)

            expect(@park.revenue).to eq(20)
        end
    end

    describe 'return value data types' do
        it 'returns the correct data types' do
            expect(@park.name.class).to eq(String)
            expect(@park.price.class).to eq(Integer)
            expect(@park.vehicles.class).to eq(Array)
            expect(@park.add_vehicle(@vehicle1).class).to eq(Array)
            expect(@park.passengers.class).to eq(Array)
            expect(@park.revenue.class).to eq(Integer)
        end
    end
end
