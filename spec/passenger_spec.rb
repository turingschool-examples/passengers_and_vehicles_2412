require './lib/passenger'

RSpec.describe Passenger do

    it 'can initialize' do
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})  
        
        expect(charlie).to be_an_instance_of(Passenger)
    end

    it 'has passenger name' do
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})

        expect(charlie.name).to eq("Charlie")
        expect(taylor.name).to eq("Taylor")
    end

    it 'has passenger age' do
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})

        expect(charlie.age).to eq(18)
        expect(taylor.age).to eq(12)
    end

    it 'can tell if they are adult' do
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})

        expect(charlie.adult?).to eq(true)
        expect(taylor.adult?).to eq(false)
    end

    it 'can set a driver' do
        charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        charlie.drive
        expect(charlie.driver?).to eq(true)
    end

end