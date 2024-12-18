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
  end

  it 'can initialize' do
    expect(@yellowstone).to be_a(Park)
    expect(@yellowstone.name).to eq("Yellowstone")
    expect(@yellowstone.price).to eq(20)
    expect(@yellowstone.vehicles_in_park).to eq([])
  end

  it 'can add vehicles entering / in the park and list them' do
    @yellowstone.add_vehicle(@vehicle2)
    @yellowstone.add_vehicle(@vehicle1)

    expect(@yellowstone.vehicles_in_park).to eq([@vehicle2, @vehicle1])
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

    expect(@yellowstone.list_passengers_in_park()).to be_a(Array)
    expect(@yellowstone.list_passengers_in_park().length).to eq(5)    #Maybe actually list people in order w/ [] to be precise?
    expect(@yellowstone.list_passengers_in_park()).to eq([@charlie, @jude, @simone, @taylor, @finneas])
  end

  it 'can calculate revenue generated based on vehicle entries' do
    @vehicle1.add_passenger(@charlie)
    @vehicle1.add_passenger(@jude)
    @vehicle2.add_passenger(@simone)
    @vehicle2.add_passenger(@taylor)
    @vehicle3.add_passenger(@finneas)

    @yellowstone.add_vehicle(@vehicle1)
    @yellowstone.add_vehicle(@vehicle2)
    expect(@yellowstone.revenue_generated()).to eq(80)

    @yellowstone.add_vehicle(@vehicle3)
    expect(@yellowstone.revenue_generated()).to eq(100)
  end

end
