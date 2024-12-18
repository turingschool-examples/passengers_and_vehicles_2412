require 'pry'
require './lib/passenger'
require './lib/vehicle'

RSpec.describe do
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
        @jude = Passenger.new({"name" => "Jude", "age" => 20}) 
    end
    describe '#initialize' do
        it 'can initialize' do
            expect(@vehicle).to be_instance_of(Vehicle)
        end
    end

    describe 'vehicle attributes' do
        it 'can tell the year' do
            expect(@vehicle.year).to eq("2001")
        end

        it 'can tell the make' do
            expect(@vehicle.make).to eq("Honda")
        end

        it 'can tell the model' do
            expect(@vehicle.model).to eq("Civic")
        end

        it 'can tell if vehicle is speeding' do
            @vehicle.speed(50)
            expect(@vehicle.speeding?).to eq(false)
            @vehicle.speed(70)
            expect(@vehicle.speeding?).to eq(true)
        end

        it 'can add passengers' do
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@taylor)
            @vehicle.add_passenger(@jude)
            expect(@vehicle.passengers).to be_an(Array)
        end

        it 'can count number of adults in vehicle' do
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@taylor)
            @vehicle.add_passenger(@jude)
            expect(@vehicle.num_adults).to eq(2)
        end
    end
end
