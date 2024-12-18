require './lib/park'
require './lib/passenger'
require './lib/vehicle'

RSpec.describe Park do
    before(:each) do
        @park = Park.new("Park1", 15)
    end

    describe "Initialize" do
        it "can create a park" do
            expect(@park).to be_a(Park)
            expect(@park.name).to eq("Park1")
            expect(@park.price).to eq(15)
        end
    end

    describe "Vehicles" do
        it "can hold vehicles" do
            expect(@park.vehicles).to eq([])
        end
    end
end