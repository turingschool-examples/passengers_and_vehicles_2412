require_relative '../lib/passenger'

RSpec.describe Passenger do
  it 'exists and has attributes' do
    # Create a passenger named Charlie who is 18 years old.
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})

    # Check the passenger's attributes.
    expect(charlie.name).to eq("Charlie")
    expect(charlie.age).to eq(18)
    expect(charlie.adult?).to eq(true)  # Charlie is an adult.
    expect(charlie.driver?).to eq(false) # Charlie is not a driver by default.
  end

  it 'can update driver status' do
    # Create a passenger and set them as a driver.
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    charlie.drive

    # Verify that the passenger is now a driver.
    expect(charlie.driver?).to eq(true)
  end
end
