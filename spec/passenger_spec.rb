#to run rspec test for this file
# rspec ./spec/passenger_spec.rb
# for the entire spec, use rspec spec

require './lib/passenger' # Add this line to require the Passenger class

RSpec.describe Passenger do # remember to use RS in caps
    describe '#initialize' do #during initialization
        it 'creates a passenger with a name and age' do #it creates a passenger with a name and age
            passenger = Passenger.new({"name" => "John Doe", "age" => 30})
            #passenger is a new instance of the Passenger class
            #= is the assignment operator
            #Passenger is the class
            #.new is the method to create a new instance of the class
            #() is where the argument passed to the initialize method
            #{ } is a hash of key value pairs 
            expect(passenger.name).to eq("John Doe")
            #expect is a method that takes in an argument
            #(passenger.name) is the method that returns the value of the name key
            #to is a method that takes in an argument
            #eq is a method that takes in an argument
            #("John Doe") is the value we are comparing to
            expect(passenger.age).to eq(30) #expect the return value of passenger.age to be 30. Claro!
        end
    end

    describe '#adult?' do #testing the adult? method to check if passenger is an adult
        it 'returns true if the passenger is 18 or older' do
            adult_passenger = Passenger.new({"name" => "Jane Doe", "age" => 20})
            minor_passenger = Passenger.new({"name" => "John Doe", "age" => 17})

            expect(adult_passenger.adult?).to be true
            expect(minor_passenger.adult?).to be false
        end
    end

    describe '#driver?' do #testing the driver? method to check if passenger is a driver
        it 'returns false by default' do
            passenger = Passenger.new({"name" => "John Doe", "age" => 30})

            expect(passenger.driver?).to be false
        end
    end

    describe '#drive' do #testing the drive method to change driver status to true
        it 'sets the passenger as a driver' do
            passenger = Passenger.new({"name" => "John Doe", "age" => 30})
            passenger.drive

            expect(passenger.driver?).to be true
        end
    end
end

