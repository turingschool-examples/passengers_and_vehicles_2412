require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do

    it 'can initialize' do
        park = Park.new("Grand Canyon", 5000)

        expect(park).to be_an_instance_of(Park)
    end

    it 'can add a vehicle' do
        park = Park.new("Grand Canyon", 5000)
        vehicle = Vehicle.new("2001", "Honda", "Civic")

        park.add_vehicle(vehicle)
        
        expect(park.vehicles.count).to eq(1)
    end
    it 'can count passengers in vehicle' do
        park = Park.new("Grand Canyon", 5000)
        vehicle = Vehicle.new("2001", "Honda", "Civic")

        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        
        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)

        park.add_vehicle(vehicle)

        expect(park.passengers[0].count).to eq(3)
    end

    it 'adds revenue per vehicle entered' do
        park = Park.new("Grand Canyon", 5000)
        vehicle = Vehicle.new("2001", "Honda", "Civic")

        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        
        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)

        park.add_vehicle(vehicle)

        expect(park.revenue).to eq(5000)
    end

    it 'turns passengers into patrons and returns their names' do
        park = Park.new("Grand Canyon", 5000)
        vehicle = Vehicle.new("2001", "Honda", "Civic")

        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        
        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)

        park.add_vehicle(vehicle)

        park.patron_names

        expect(park.patrons).to eq(["Charlie", "Jude", "Taylor"])
    end

    it 'adds minors and adults into their respective lists' do
        park = Park.new("Grand Canyon", 5000)
        vehicle = Vehicle.new("2001", "Honda", "Civic")

        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        jude = Passenger.new({"name" => "Jude", "age" => 20})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        
        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)

        park.add_vehicle(vehicle)

        park.minors
        park.adults

        expect(park.minors).to eq(["Taylor"])
        expect(park.adults).to eq(["Charlie", "Jude"])
    end
end