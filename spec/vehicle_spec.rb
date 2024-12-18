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

  it 'determines if a vehicle initially has passengers' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    expect(vehicle.passengers).to eq([])

  end

  it 'adds passengers to a vehicle' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)

    # expect(vehicle.passengers).to eq([charlie, jude, taylor])
    expect(vehicle.passengers[0].name).to eq("Charlie")
    expect(vehicle.passengers[1].name).to eq("Jude")
    expect(vehicle.passengers[2].name).to eq("Taylor")


  end

  it 'counts the number of adult passengers' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  
    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)
  
    expect(vehicle.num_adults).to eq(2)
  end







end