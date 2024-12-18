require 'rspec'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
        @charlie = Passenger.new({name: "Charlie", age: 18})
        @jude = Passenger.new({name: "Jude", age: 20})
        @taylor = Passenger.new({name: "Taylor", age: 12})
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

    describe '#speeding' do
        xit 'can tell if it is speeding' do
            expect(@vehicle.speeding?).to eq(false)
        end

        xit 'can add speed and see it is speeding' do
            @vehicle.speed

            expect(@vehicle.speeding?).to eq(true)
        end
    end

    describe '#passengers' do
        xit 'can carry passengers' do
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@jude)
            @vehicle.add_passenger(@taylor)

            expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
        end
    end
end