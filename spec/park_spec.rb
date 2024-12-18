# spec/park_spec.rb

require_relative '../lib/park'
require_relative '../lib/vehicle'
require_relative '../lib/passenger'

RSpec.describe Park do
  before(:each) do
    # Create a park and associated test data.
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
    # Test park attributes.
    expect(@park).to be_a(Park)
    expect(@park.name).to eq("Yellowstone")
    expect(@park.price).to eq(50)
    expect(@park.vehicles).to eq([])
  end

  it 'can add vehicles' do
    # Add vehicles to the park.
    @park.add_vehicle(@vehicle1)
    expect(@park.vehicles).to eq([@vehicle1])

    @park.add_vehicle(@vehicle2)
    expect(@park.vehicles).to eq([@vehicle1, @vehicle2])
  end

  it 'can list all passengers' do
    # Add vehicles to the park and list all passengers.
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)

    expect(@park.passengers).to eq([@charlie, @jude, @taylor])
  end

  it 'can calculate revenue generated' do
    # Add vehicles to the park and calculate revenue from adult passengers.
    @park.add_vehicle(@vehicle1)
    @park.add_vehicle(@vehicle2)

    # Only Charlie and Taylor are adults, so 2 * $50 = $100.
    expect(@park.revenue).to eq(100)
  end
end
