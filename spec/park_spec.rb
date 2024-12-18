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

        it 'can track patrons' do
            @park.add_passenger(@charlie)
            @park.add_passenger(@taylor)
            @park.add_passenger(@jude)
            @park.patron_names
            expect(@park.patron_names).to eq(["Charlie", "Jude", "Taylor"])
        end

        it 'can track minors' do
            @park.add_passenger(@charlie)
            @park.add_passenger(@taylor)
            @park.add_passenger(@jude)
            @park.minors
            expect(@park.minors).to eq(["Taylor"])
        end

        it 'can track adults' do
            @park.add_passenger(@charlie)
            @park.add_passenger(@taylor)
            @park.add_passenger(@jude)
            @park.adults
            expect(@park.adults).to eq(["Charlie", "Jude"])
        end
    end
end