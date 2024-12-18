require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do

  it 'returns a vehicle exists' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle).to be_a(Vehicle)

  end

  it 'returns the vehicle year, make, and model' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.year).to eq("2001")
    expect(vehicle.make).to eq("Honda")
    expect(vehicle.model).to eq("Civic")

  end

  it 'determines if a vehicle is speeding' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
  
    expect(vehicle.speeding?).to eq(false) 
  
    vehicle.speed 
  
    expect(vehicle.speeding?).to eq(true) 

  end



end