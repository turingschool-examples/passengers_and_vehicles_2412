require './lib/vehicle.rb'
require './lib/passenger.rb'
require './lib/park.rb'

RSpec.describe Park do
  before(:each) do
    @yellowstone = Park.new("Yellowstone", 20)
    
    @vehicle = Vehicle.new("2001", "Honda", "Civic")

    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
  end

  it 'can initialize' do
    expect(@yellowstone).to be_a(Park)
    expect(@yellowstone.name).to eq("Yellowstone")
    expect(@yellowstone.price).to eq(20)
  end
  
end
