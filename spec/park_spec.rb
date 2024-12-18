require './lib/vehicle.rb'
require './lib/passenger.rb'
require './lib/park.rb'

RSpec.describe Park do
  before(:each) do
    @yellowstone = Park.new("Yellowstone", 20)
    
    @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle2 = Vehicle.new("2016", "Subaru", "Forester")

    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
  end

  it 'can initialize' do
    expect(@yellowstone).to be_a(Park)
    expect(@yellowstone.name).to eq("Yellowstone")
    expect(@yellowstone.price).to eq(20)
    expect(@yellowstone.vehicles_in_park).to eq([])
  end

  it 'can add vehicles entering / in the park and list them' do
    @yellowstone.add_vehicle(@vehicle2)
    @yellowstone.add_vehicle(@vehicle1)

    expect(@yellowstone.vehicles_in_park).to eq([@vehicle2, @vehicle1])
  end

end
