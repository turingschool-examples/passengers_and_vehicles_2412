require './lib/passenger.rb'

RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'can initialize' do
    expect(@charlie).to be_a(Passenger)
    expect(@taylor).to be_a(Passenger)
    expect(@charlie.name).to eq("Charlie")
    expect(@charlie.age).to eq(18)

  end

  it 'can test if passenger is an adult' do
    expect(@charlie.adult?()).to eq(true)
    expect(@taylor.adult?()).to eq(false)
  end

  it 'can test if passenger is a driver by default' do
    expect(@charlie.driver?()).to eq(false)
  end

  it 'can drive a vehicle and change is_driver status' do
    @charlie.drive()
    expect(@charlie.driver?()).to eq(true)
  end
    
end
