require './lib/vehicle.rb'
require './lib/passenger.rb'

RSpec.describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")

    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
  end

  it 'can initialize' do
    expect(@vehicle).to be_a(Vehicle)
    expect(@vehicle.year).to eq("2001")
    expect(@vehicle.make).to eq("Honda")
    expect(@vehicle.model).to eq("Civic")
    expect(@vehicle.passengers).to eq([])
  end

  it 'check if speeding by default' do
    expect(@vehicle.speeding?()).to eq(false)
  end
  
  it 'can speed and update instance var accordingly' do
    @vehicle.speed()
    expect(@vehicle.speeding?()).to eq(true)
  end

  it 'can add passengers to the current vehicle' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
  
    expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
  end

  it 'can determine the number of adults in the vehicle' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@taylor)
    
    expect(@vehicle.num_adults()).to eq(1)

    @vehicle.add_passenger(@jude)
    expect(@vehicle.num_adults()).to eq(2)
  end

end
