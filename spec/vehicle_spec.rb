# frozen_string_literal: true

require_relative 'spec_helper'

describe Vehicle do
  subject(:vehicle) { described_class.new('2001', 'Honda', 'Civic') }

  let(:charlie) { Passenger.new({ 'name' => 'Charlie', 'age' => 18 }) }
  let(:jude) { Passenger.new({ 'name' => 'Jude', 'age' => 20 }) }
  let(:taylor) { Passenger.new({ 'name' => 'Taylor', 'age' => 12 }) }

  describe '#initialize' do
    it { is_expected.to be_an_instance_of(described_class) }

    it 'has a year' do
      expect(vehicle.year).to eq('2001')
    end

    it 'has a make' do
      expect(vehicle.make).to eq('Honda')
    end

    it 'has a model' do
      expect(vehicle.model).to eq('Civic')
    end

    it 'is not speeding' do
      expect(vehicle.speeding?).to be false
    end

    it 'has no passengers' do
      expect(vehicle.passengers).to eq([])
    end
  end

  describe '#speed' do
    before do
      vehicle.speed
    end

    it 'can set speeding status' do
      expect(vehicle.speeding?).to be true
    end
  end

  describe '#add_passenger' do
    before do
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
    end

    it 'can add passengers' do
      expect(vehicle.passengers).to eq([charlie, jude, taylor])
    end
  end

  describe '#num_adults' do
    before do
      vehicle.add_passenger(charlie)
      vehicle.add_passenger(jude)
      vehicle.add_passenger(taylor)
    end

    it 'can count the number of adults' do
      expect(vehicle.num_adults).to eq(2)
    end
  end
end
