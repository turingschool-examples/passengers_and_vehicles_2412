require './lib/passenger'

RSpec.describe Passenger do 
    before(:each) do 
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})  
    end

    describe '#initialize' do 
        it 'initializes with attributes' do 
            expect(@charlie).to be_a(Passenger)
        end

        it 'has a name and age' do 
            expect(@charlie.name).to eq("Charlie")
            expect(@charlie.age).to eq(18)
        end
    end

    describe '#adult?' do 
        it 'checks if the passenger is an adult' do 
            expect(@charlie.adult?).to eq(true)
            expect(@taylor.adult?).to eq(false)
        end
    end

    describe '#driver?' do 
        it 'returns false by default for a new passenger' do 
            expect(@charlie.driver?).to eq(false)
        end
    end

    describe '#drive' do 
        it 'marks the passenger as the driver' do 
            expect(@charlie.driver?).to eq(false)

            @charlie.drive
            expect(@charlie.driver?).to eq(true)
        end
    end
end