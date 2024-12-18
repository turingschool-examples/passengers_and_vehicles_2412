require 'rspec'
require './lib/passenger'

RSpec.describe Passenger do
    before(:each) do
        @charlie = Passenger.new({name: "Charlie", age: 18})
        @taylor = Passenger.new({name: "Taylor", age: 12})
    end

    describe '#initialize' do
        it 'is an instance of a Passenger' do
            expect(@charlie).to be_an_instance_of(Passenger)
        end
    end

    describe '#name' do
        it 'can tell its name' do
            expect(@charlie.name).to eq("Charlie")
        end
    end

    describe '#age' do
        it 'can tell its age' do
            expect(@charlie.age).to eq(18)
        end
    end

    describe '#adult?' do
        it 'can assess if it is an adult or not' do
            expect(@charlie.adult?).to eq(true)
            expect(@taylor.adult?).to eq(false)
        end
    end

    describe '#driver?' do
        xit 'can assess if the passenger is the driver' do
            expect(@charlie.driver?).to eq(false)
        end
    end

    describe '#drive' do
        xit 'can reassign who the driver is' do
            expect(@charlie.driver?).to eq(false)

            charlie.drive

            expect(@charlie.driver?).to eq(true)
        end
    end
end