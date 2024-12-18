require 'rspec'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
    end

    describe '#initialize' do
        xit 'is an instance of a Vehicle' do
            expect(@vehicle).to be_an_instance_of(Vehicle)
        end
    end

    describe 'initialized traits' do
        xit 'can tell year' do
            expect(@vehicle.year).to eq("2001")
        end

        xit 'can tell make' do
            expect(@vehicle.make).to eq("Honda")
        end

        xit 'can tell model' do
            expect(@vehicle.model).to eq("Civic")
        end
    end
end