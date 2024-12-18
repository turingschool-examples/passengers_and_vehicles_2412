require './lib/vehicle'
require './lib/passenger'
require 'RSpec'

RSpec.describe Vehicle do
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})  
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})
    end
    it 'vehicle exists' do
        expect(@vehicle).to be_a(Vehicle)
    end
    it 'returns the vehicle info' do
        expect(@vehicle.year).to eq("2001")
        expect(@vehicle.make).to eq('Honda')
        expect(@vehicle.model).to eq("Civic")
    end
    it 'returns if vehicle is speeding' do
        expect(@vehicle.speeding?).to be(false)
    end
    
    it 'updates if vehicle is speeding' do
        @vehicle.speed
        expect(@vehicle.speeding).to be(true)
    end

    it 'returns [] for vehicle passengers' do
        expect(@vehicle.passengers).to eq([])
    end
    
    it 'adds passenger' do
        @vehicle.add_passenger(@charlie)
        @vehicle.add_passenger(@jude)
        @vehicle.add_passenger(@taylor)
        
        expect(@vehicle.passengers).to include(@charlie, @jude, @taylor)
    end

    it 'counts adult passengers' do
        @vehicle.add_passenger(@charlie)
        @vehicle.add_passenger(@jude)
        @vehicle.add_passenger(@taylor)

        expect(@vehicle.num_adults).to eq(2)

    end
    

end