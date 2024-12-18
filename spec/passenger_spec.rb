require './lib/passenger'

RSpec.describe Passenger do
    before(:each) do 
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    end

    describe '#initialize' do
        it 'can initalize' do
            expect(@charlie).to be_an_instance_of(Passenger)
            expect(@charlie.name).to eq("Charlie")
            expect(@charlie.age).to eq(18)
        end
    end

    describe '#adult?' do
        it "passenger is an adult if 18 or older" do
            expect(@charlie.adult?).to eq(true)
            expect(@taylor.adult?).to eq(false)
        end
    end

    describe '#driver?' do
        it "figures out who is driving" do
            expect(@charlie.driver?).to eq(false)

            @charlie.drive

            expect(@charlie.driver?).to eq(true)
        end
    end

end