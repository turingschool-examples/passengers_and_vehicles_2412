require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do 
    before(:each) do 
        @park_1 = Park.new({:name => "Haleakala", :price => 25})
        @park_2 = Park.new({:name => "Pfeiffer Big Sur State Park", :price => 20})
 
        @vehicle_1 = Vehicle.new("1969", "Volkswagen", "Mystery Machine") 
        @vehicle_2 = Vehicle.new("2013", "Hyundai", "Elantra") 

        @passenger_1 = Passenger.new({"name" => "Wilma", "age" => 26}) 
        @passenger_2 = Passenger.new({"name" => "Freddy", "age" => 27})
        @passenger_3 = Passenger.new({"name" => "Shaggy", "age" => 31}) 
        @passenger_4 = Passenger.new({"name" => "Daphne", "age" => 27}) 
        @passenger_5 = Passenger.new({"name" => "Scooby", "age" => 7})

        @passenger_6 = Passenger.new({"name" => "Will", "age" => 34}) 
        @passenger_7 = Passenger.new({"name" => "Tim", "age" => 35})
    end

    def add_scooby_doo_characters(vehicle)
        vehicle.add_passenger(@passenger_1)
        vehicle.add_passenger(@passenger_2)
        vehicle.add_passenger(@passenger_3)
        vehicle.add_passenger(@passenger_4)
        vehicle.add_passenger(@passenger_5)
      end


    describe '#initialize' do 
        it 'initializes with attributes' do 
            expect(@park_1).to be_a(Park)
            expect(@park_2).to be_a(Park)
        end

        it 'has a unique name and a price' do 
            expect(@park_1.name).to eq("Haleakala")
            expect(@park_2.name).to eq("Pfeiffer Big Sur State Park")

            expect(@park_1.price).to eq(25)
            expect(@park_2.price).to eq(20)
        end

        it 'keeps track of vehicles that have entered the park' do 
            expect(@park_1.vehicles).to eq([])
        end

        it 'keeps track of passengers that have entered the park' do 
            expect(@park_1.passengers).to eq([])
        end
    end

    describe '#add_vehicle' do 
        it 'records a vehicle with passengers that has entered the park' do 
            expect(@park_1.vehicles).to eq([])
            
            add_scooby_doo_characters(@vehicle_1)

            @park_1.add_vehicle(@vehicle_1)

            expect(@park_1.vehicles).to eq([@vehicle_1])
            expect(@park_1.passengers).to eq([@passenger_1, @passenger_2, @passenger_3, @passenger_4, @passenger_5])
        end

        it 'shows the last vehicle that entered the park' do 
            expect(@park_1.vehicles).to eq([])
            
            add_scooby_doo_characters(@vehicle_1)

            @park_1.add_vehicle(@vehicle_1)

            expect(@park_1.vehicles).to eq([@vehicle_1])
            expect(@park_1.passengers).to eq([@passenger_1, @passenger_2, @passenger_3, @passenger_4, @passenger_5])

            @vehicle_2.add_passenger(@passenger_6)
            @vehicle_2.add_passenger(@passenger_7)

            @park_1.add_vehicle(@vehicle_2)

            expect(@park_1.vehicles).to eq([@vehicle_1, @vehicle_2])
            expect(@park_1.passengers).to eq([@passenger_1, @passenger_2, @passenger_3, @passenger_4, @passenger_5, @passenger_6, @passenger_7])

            expect(@park_1.vehicles.last).to eq(@vehicle_2)
        end
    end

    describe '#revenue' do 
        it 'tracks revenue for the park based on adult admission prices only' do 
            expect(@park_1.vehicles).to eq([])
            expect(@park_1.passengers).to eq([])
            expect(@park_1.revenue).to eq(0)
        
            @vehicle_1.add_passenger(@passenger_1)
            @vehicle_1.add_passenger(@passenger_2)
            @vehicle_1.add_passenger(@passenger_3)
            @vehicle_1.add_passenger(@passenger_4)
            @vehicle_1.add_passenger(@passenger_5) 

            expect(@passenger_5.adult?).to eq(false)
        
            @park_1.add_vehicle(@vehicle_1)
        
            expect(@park_1.revenue).to eq(25 * 4) 
        
            @vehicle_2.add_passenger(@passenger_6)
            @vehicle_2.add_passenger(@passenger_7)
        
            @park_1.add_vehicle(@vehicle_2)
        
            expect(@park_1.revenue).to eq(25 * 6) 
        end

        it 'calculates revenue for a park with a different admission price' do
            expect(@park_2.vehicles).to eq([])
            expect(@park_2.passengers).to eq([])
            expect(@park_2.revenue).to eq(0)

            @vehicle_1.add_passenger(@passenger_1)
            @vehicle_1.add_passenger(@passenger_2)
            @vehicle_1.add_passenger(@passenger_3)

            @park_2.add_vehicle(@vehicle_1)

            expect(@park_2.revenue).to eq(20 *3)

            @vehicle_2.add_passenger(@passenger_6)
            @vehicle_2.add_passenger(@passenger_7)

            @park_2.add_vehicle(@vehicle_2)

            expect(@park_2.revenue).to eq(20 * 5)
        end
    end

    describe '#list_visitor_names' do 
        it 'returns a list of visitors' do 
            @vehicle_1.add_passenger(@passenger_1)
            @vehicle_1.add_passenger(@passenger_2)
            @vehicle_1.add_passenger(@passenger_3)
            @vehicle_1.add_passenger(@passenger_4)
            @vehicle_1.add_passenger(@passenger_5)

            @park_1.add_vehicle(@vehicle_1)

            expect(@park_1.list_visitor_names).to eq(["Wilma", "Freddy", "Shaggy", "Daphne", "Scooby"])
        end
    end

    describe '#list_vehicle_names' do 
        it 'returns a list of vehicle names' do 
            @park_1.add_vehicle(@vehicle_1)
            @park_1.add_vehicle(@vehicle_2)

            expect(@park_1.list_vehicle_names).to eq(["Volkswagen Mystery Machine", "Hyundai Elantra"])
        end
    end
end