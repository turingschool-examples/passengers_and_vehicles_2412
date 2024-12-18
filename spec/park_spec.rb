require 'rspec'
require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Park do
    before(:each) do
        @yosemite = Park.new({park_name: "Yosemite", entry_fee: 100})
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
end