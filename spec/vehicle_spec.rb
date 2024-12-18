require './lib/vehicle'
require './lib/passenger'

RSpec. describe Vehicle do 
    before(:each) do 
        @vehicle = Vehicle.new("2001", "Honda", "Civic")  

        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})   
        @jude = Passenger.new({"name" => "Jude", "age" => 20})   
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
    end

    describe '#initialize' do 
        it 'initializes with attributes' do 
            expect(@vehicle).to be_a(Vehicle)
        end

        it 'has attributes' do
            expect(@vehicle.year).to eq("2001")
            expect(@vehicle.make).to eq("Honda")
            expect(@vehicle.model).to eq("Civic")
            expect(@vehicle.passengers).to eq([])
        end
    end

    describe '#speeding?' do 
        it 'checks if the vehicle is speeding, returns false by default for new vehicle' do 
            expect(@vehicle.speeding?).to eq(false)
        end
    end

    describe '#speed' do 
        it 'marks vehicle as speeding' do 
            expect(@vehicle.speeding?).to eq(false)
            
            @vehicle.speed
            expect(@vehicle.speeding?).to eq(true)
        end
    end

    describe '#add_passenger' do 
        it 'adds passengers to the vehicle' do
            expect(@vehicle.passengers).to eq([])

            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@jude) 
            @vehicle.add_passenger(@taylor)

            expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
        end
    end
    
    describe '#num_adults' do 
        it 'counts the number of adults in teh vehicle' do 
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@jude) 
            @vehicle.add_passenger(@taylor)

            expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
            expect(@vehicle.num_adults).to eq(2)
        end
    end
end