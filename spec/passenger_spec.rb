require './lib/passenger'
require 'rspec'

describe Passenger do
  before do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlie).to be_a(Passenger)
      expect(@taylor).to be_a(Passenger)
    end

    it 'has a name' do
      expect(@charlie.name).to eq("Charlie")
      expect(@taylor.name).to eq("Taylor")
    end

    it 'has an age' do
      expect(@charlie.age).to eq(18)
      expect(@taylor.age).to eq(12)
    end
  end

  describe '#adult?' do
    it 'can check whether a passenger is an adult' do
      expect(@charlie.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)
    end
  end

  describe '#driver?' do
    it 'can check whether a passenger is the driver' do
      expect(@charlie.driver?).to eq(false)
      expect(@taylor.driver?).to eq(false)
    end
  end

  describe '#drive' do
    it 'can make a passenger the driver' do
      expect(@charlie.driver?).to eq(false)
      @charlie.drive
      expect(@charlie.driver?).to eq(true)
    end
  end

end