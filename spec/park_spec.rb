require './lib/vehicle.rb'
require './lib/passenger.rb'
require './lib/park.rb'

RSpec.describe Park do
  before(:each) do
    @yellowstone = Park.new("Yellowstone", 20)
    
    @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle2 = Vehicle.new("2016", "Subaru", "Forester")
    @vehicle3 = Vehicle.new("2022", "Telsa", "S3")

    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @finneas = Passenger.new({"name" => "Finneas", "age" => 30})
    @simone = Passenger.new({"name" => "Simone", "age" => 34})
    @abigail = Passenger.new({"name" => "Abigail", "age" => 14})
  end

  it 'can initialize' do
    expect(@yellowstone).to be_a(Park)
    expect(@yellowstone.name).to eq("Yellowstone")
    expect(@yellowstone.price).to eq(20)
    expect(@yellowstone.vehicles).to eq([])
  end

  it 'can add vehicles entering / in the park and list them' do
    @yellowstone.add_vehicle(@vehicle2)
    @yellowstone.add_vehicle(@vehicle1)

    expect(@yellowstone.vehicles()).to eq([@vehicle2, @vehicle1])
  end
  
  it 'can list all passengers in the park' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle2.add_passenger(@simone)
    @vehicle2.add_passenger(@taylor)
    @vehicle3.add_passenger(@finneas)
    
    @yellowstone.add_vehicle(@vehicle1)
    @yellowstone.add_vehicle(@vehicle2)
    @yellowstone.add_vehicle(@vehicle3)

    expect(@yellowstone.passengers()).to be_a(Array)
    expect(@yellowstone.passengers().length).to eq(5)
    expect(@yellowstone.passengers()).to eq([@charlie, @jude, @simone, @taylor, @finneas])
  end

  it 'can calculate revenue generated based on vehicle and passenger entries' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle2.add_passenger(@simone)
    @vehicle2.add_passenger(@taylor)
    @vehicle3.add_passenger(@finneas)

    @yellowstone.add_vehicle(@vehicle1)
    @yellowstone.add_vehicle(@vehicle2)
    expect(@yellowstone.revenue()).to eq(80)

    @yellowstone.add_vehicle(@vehicle3)
    expect(@yellowstone.revenue()).to eq(100)
  end

  it 'helper method calculate_entrance_fee() for generating revenue works correctly' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@simone)
    @vehicle1.add_passenger(@taylor)

    expect(@yellowstone.calculate_entrance_fee(@vehicle1)).to eq(60)
  end

  it 'can generate alphabetized list of all park patrons' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle2.add_passenger(@simone)
    @vehicle2.add_passenger(@taylor)
    @vehicle3.add_passenger(@finneas)
    @vehicle3.add_passenger(@abigail)
    @yellowstone.add_vehicle(@vehicle1)
    @yellowstone.add_vehicle(@vehicle2)
    @yellowstone.add_vehicle(@vehicle3)

    expect(@yellowstone.patron_names()).to eq(["Abigail", "Charlie", "Finneas", "Jude", "Simone", "Taylor"])
  end

  it 'can generate alphabetized list of all adult patrons' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle2.add_passenger(@simone)
    @vehicle2.add_passenger(@taylor)
    @vehicle3.add_passenger(@finneas)
    @vehicle3.add_passenger(@abigail)
    @yellowstone.add_vehicle(@vehicle1)
    @yellowstone.add_vehicle(@vehicle2)
    @yellowstone.add_vehicle(@vehicle3)

    expect(@yellowstone.adults().length).to eq(4)
    expect(@yellowstone.adults()).to eq(["Charlie", "Finneas", "Jude", "Simone"])
  end

  it 'can generate alphabetized list of all minor patrons' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle2.add_passenger(@simone)
    @vehicle2.add_passenger(@taylor)
    @vehicle3.add_passenger(@finneas)
    @vehicle3.add_passenger(@abigail)
    @yellowstone.add_vehicle(@vehicle1)
    @yellowstone.add_vehicle(@vehicle2)
    @yellowstone.add_vehicle(@vehicle3)

    expect(@yellowstone.minors().length).to eq(2)
    expect(@yellowstone.minors()).to eq(["Abigail", "Taylor"])
  end

end
