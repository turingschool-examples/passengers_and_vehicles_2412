# spec/passenger_spec.rb

require_relative '../lib/passenger'

RSpec.describe Passenger do
  describe 'Initialization' do
    it 'exists and has attributes' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})

      expect(charlie.name).to eq("Charlie")
      expect(charlie.age).to eq(18)
    end
  end

  describe 'Methods' do
    it 'can determine if a passenger is an adult' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      taylor = Passenger.new({"name" => "Taylor", "age" => 12})

      expect(charlie.adult?).to eq(true)
      expect(taylor.adult?).to eq(false)
    end

    it 'can check and update driver status' do
      charlie = Passenger.new({"name" => "Charlie", "age" => 18})

      expect(charlie.driver?).to eq(false)
      charlie.drive
      expect(charlie.driver?).to eq(true)
    end
  end
end
