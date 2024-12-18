require 'pry'
require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe do
    before(:each)do 
        @park = Park.new({"name" => "Devil's Lake","admission price" => 15})
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
        @jude = Passenger.new({"name" => "Jude", "age" => 20}) 
    end
    describe 'intialize' do
        it 'can intialize'do 
        expect(@park).to be_instance_of(Park)
        expect(@park.name).to eq("Devil's Lake")
        expect(@park.admission_price).to eq(15)
        end
    end

    describe 'park attributes' do
        it 'can store vehicles in park' do
            @park.add_vehicle(@vehicle)
            expect(@park.vehicles_in_park).to be_an(Array)
        end

        it 'can store passengers in park' do
            @park.add_passenger(@charlie)
            @park.add_passenger(@taylor)
            @park.add_passenger(@jude)
            expect(@park.passengers_in_park).to be_an(Array)
        end

        it 'can charge admission price for adults' do
            @park.add_passenger(@charlie)
            @park.add_passenger(@taylor)
            @park.add_passenger(@jude)
            expect(@park.revenue).to be_an(Integer)
            expect(@park.revenue).to eq(30)

        end
    end
end