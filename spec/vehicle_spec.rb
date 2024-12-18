require_relative '../lib/vehicle'
require_relative '../lib/passenger'


RSpec.describe Vehicle do
  before(:each) do
    # Create a vehicle and some passengers for testing.
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 12})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 25})
  end

  it 'exists and has attributes' do
    # Verify the vehicle's attributes.
    expect(@vehicle).to be_a(Vehicle)
    expect(@vehicle.year).to eq("2001")
    expect(@vehicle.make).to eq("Honda")
    expect(@vehicle.model).to eq("Civic")
    expect(@vehicle.passengers).to eq([])
  end

  it 'can add passengers' do
    # Add passengers to the vehicle.
    @vehicle.add_passenger(@charlie)
    expect(@vehicle.passengers).to eq([@charlie])

    @vehicle.add_passenger(@jude)
    expect(@vehicle.passengers).to eq([@charlie, @jude])
  end

  it 'can count the number of adults' do
    # Add passengers and count the number of adults.
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)

    expect(@vehicle.num_adults).to eq(2) # Charlie and Taylor are adults.
  end
end
