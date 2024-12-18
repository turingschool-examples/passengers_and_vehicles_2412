require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
    describe "initialize" do
        it "can create a vehicle" do
            vehicle = Vehicle.new("2001", "Honda", "Civic")

            expect(vehicle).to be_a(Vehicle)
            expect(vehicle.year).to eq("2001")
            expect(vehicle.make).to eq("Honda")
            expect(vehicle.model).to eq("Civic")
        end
    end
end