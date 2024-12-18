require_relative '../lib/vehicle'
require_relative '../lib/passenger'

RSpec.describe Vehicle do
  before(:each) do
    # Create a vehicle and passengers for testing.
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 12})
  end

  it 'exists and has attributes' do
    # Check the vehicle's attributes.
    expect(@vehicle.year).to eq("2001")
    expect(@vehicle.make).to eq("Honda")
    expect(@vehicle.model).to eq("Civic")
    expect(@vehicle.passengers).to eq([]) # Vehicle starts with no passengers.
  end

  it 'can add passengers' do
    # Add a passenger to the vehicle.
    @vehicle.add_passenger(@charlie)
    expect(@vehicle.passengers).to include(@charlie)
  end

  it 'can count the number of adults' do
    # Add passengers and count adults.
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    expect(@vehicle.num_adults).to eq(1) # Only Charlie is an adult.
  end
end
