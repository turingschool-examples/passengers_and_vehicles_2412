require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do

    it 'can initialize' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")

        expect(vehicle).to be_an_instance_of(Vehicle)
    end

    it 'has attributes' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        
        expect(vehicle.year).to eq("2001")
        expect(vehicle.make).to eq("Honda")
        expect(vehicle.model).to eq("Civic")
    end

    it 'can speed' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        expect(vehicle.speeding?).to eq(false)
        vehicle.speed
        expect(vehicle.speeding?).to eq(true)
    end

    it 'can add passengers' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})

        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)

        expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end

    it 'adds number of adults to adults count' do
        vehicle = Vehicle.new("2001", "Honda", "Civic")
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})

        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)

        vehicle.num_adults

        expect(vehicle.adults).to eq(2)
    end

end