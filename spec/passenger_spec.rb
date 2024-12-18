require 'RSpec'
require './lib/passenger'

RSpec.describe Passenger do
    before(:each) do
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})
    end
    it "passengers exist" do
        expect(charlie = Passenger.new({"name" => "Charlie", "age" => 18})).to be_a(Passenger)
        expect(taylor = Passenger.new({"name" => "Taylor", "age" => 12})).to be_a(Passenger)
    end

    it "returns passenger info" do 
        expect(@charlie.name).to eq('Charlie')
        expect(@charlie.age).to eq(18)

    end

    it 'returns if passengers are adults' do
        expect(@charlie.adult?).to be(true)
        expect(@taylor.adult?).to be(false)
    end

    it "returns if passenger is a driver" do
        expect(@charlie.driver?).to be(false)
    end

    it 'makes passenger a driver' do
        @charlie.drive
        expect(@charlie.driver?).to be(true)
    end

end