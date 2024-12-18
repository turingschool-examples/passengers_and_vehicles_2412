require './lib/passenger'
require 'pry'

RSpec.describe do 
    before(:each) do
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
    end

    describe '#intialize' do
        it ' can initialize' do
            expect(@charlie).to be_instance_of(Passenger)
            expect(@taylor).to be_instance_of(Passenger)
        end
    end

    describe 'passenger attributes' do
        it 'can call their name'do
            expect(@charlie.name).to eq("Charlie")
            expect(@taylor.name).to eq("Taylor")
        end

        it 'can call their age' do
            expect(@charlie.age).to eq(18)
            expect(@taylor.age).to eq(12)
        end

        it 'can tell if they are an adult' do
            expect(@charlie.adult?).to eq(true)
            expect(@taylor.adult?).to eq(false)
        end

        it 'can allow adult drivers' do
            expect(@taylor.driver?).to eq(false)
            @charlie.drive
            expect(@charlie.driver?).to eq(true)
        end

    end
end