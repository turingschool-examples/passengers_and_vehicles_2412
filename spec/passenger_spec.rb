#to run rspec test for this file
# rspec ./spec/passenger_spec.rb
# for the entire spec, use rspec spec

require './lib/passenger' # Add this line to require the Passenger class

RSpec.describe Passenger do
    describe '#initialize' do
        it 'creates a passenger with a name and age' do
            passenger = Passenger.new({"name" => "John Doe", "age" => 30})

            expect(passenger.name).to eq("John Doe")
            expect(passenger.age).to eq(30)
        end
    end

    describe '#adult?' do
        it 'returns true if the passenger is 18 or older' do
            adult_passenger = Passenger.new({"name" => "Jane Doe", "age" => 20})
            minor_passenger = Passenger.new({"name" => "John Doe", "age" => 17})

            expect(adult_passenger.adult?).to be true
            expect(minor_passenger.adult?).to be false
        end
    end

    describe '#driver?' do
        it 'returns false by default' do
            passenger = Passenger.new({"name" => "John Doe", "age" => 30})

            expect(passenger.driver?).to be false
        end
    end

    describe '#drive' do
        it 'sets the passenger as a driver' do
            passenger = Passenger.new({"name" => "John Doe", "age" => 30})
            passenger.drive

            expect(passenger.driver?).to be true
        end
    end
end

