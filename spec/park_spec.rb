require 'rspec'
require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Park do
    before(:each) do
        @yosemite = Park.new({park_name: "Yosemite", entry_fee: 100})
        @course = Vehicle.new("2077", "Course", "Samurai")
        @jacob = Passenger.new({name: "Jacob", age: 29})
        @baby = Passenger.new({name: "Chase", age: 1})
        @toadking = Passenger.new({name: "The Toad King", age: 51})
        @course.add_passenger(@jacob)
        @course.add_passenger(@baby)
        @course.add_passenger(@toadking)
    end

    describe 'initialize' do
        it 'is an instance of a park' do
            expect(@yosemite).to be_an_instance_of(Park)
        end
    end

    describe 'initialized traits' do
        it 'can tell park name' do
            expect(@yosemite.park_name).to eq("Yosemite")
        end

        it 'can tell its entry fee' do
            expect(@yosemite.entry_fee).to eq(100)
        end

        it 'can tell how many vehicles are currently in it' do
            expect(@yosemite.vehicles).to eq([])
        end
    end

    describe '#add_vehicle' do
        it 'can keep track of vehicles entering park' do
            @yosemite.add_vehicle(@course)

            expect(@yosemite.vehicles).to eq([@course])
        end
    end

    describe '#passengers' do
        it 'can tell passengers in a vehicle' do
            @yosemite.add_vehicle(@course)

            expect(@yosemite.passengers).to eq([@jacob, @baby, @toadking])
        end
    end

    describe '#revenue' do
        it 'can calculate revenue by passenger' do
            @yosemite.add_vehicle(@course)

            expect(@yosemite.revenue).to eq(200)
        end
    end
end