require_relative '../lib/park'
require_relative '../lib/vehicle'
require_relative '../lib/passenger'

RSpec.describe Park do
  before(:each) do
    # Create a park and test data.
    @park = Park.new("Yellowstone", 50)
    @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle2 = Vehicle.new("2010", "Toyota", "Corolla")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 12})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 25})

    # Add passengers to vehicles.
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle2.add_passenger(@taylor)
  end

  it 'exists and has attributes' do
    # Check the park's attributes.
    expect(@park.name).to eq("Yellowstone")
    expect(@park.price).to eq(50)
    expect(@park.vehicles).to eq([]) # Park starts with no vehicles.
  end

  it 'can add vehicles' do
    # Add vehicles to the park.
    @park.add_vehicle(@vehicle1)
    expect(@park.vehicles).to eq([@vehicle1])
  end

  it 'can calculate revenue' do
    # Add vehicles and calculate revenue from adult passengers.
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)
    expect(@park.revenue).to eq(100) # Charlie and Taylor generate revenue.
  end

  it 'can list patron names alphabetically' do
    # Add vehicles and list passenger names alphabetically.
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)
    expect(@park.patron_names).to eq(["Charlie", "Jude", "Taylor"])
  end

  it 'can list minors alphabetically' do
    # Add vehicles and list minors alphabetically.
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)
    expect(@park.minors).to eq(["Jude"])
  end

  it 'can list adults alphabetically' do
    # Add vehicles and list adults alphabetically.
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)
    expect(@park.adults).to eq(["Charlie", "Taylor"])
  end
end
