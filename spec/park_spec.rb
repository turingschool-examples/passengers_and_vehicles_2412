# frozen_string_literal: true

require_relative 'spec_helper'

describe Park do
  subject(:everglades) { described_class.new('Everglades', 35) }

  let(:timucuan) { described_class.new('Timucuan', 5) }
  let(:vehicle) { Vehicle.new('2001', 'Honda', 'Civic') }
  let(:charlie) { Passenger.new({ 'name' => 'Charlie', 'age' => 18 }) }
  let(:jude) { Passenger.new({ 'name' => 'Jude', 'age' => 20 }) }
  let(:taylor) { Passenger.new({ 'name' => 'Taylor', 'age' => 12 }) }

  describe '#initialize' do
    it { is_expected.to be_an_instance_of(described_class) }

    it 'has a name' do
      expect(everglades.name).to eq('Everglades')
    end

    it 'can have a different name' do
      expect(timucuan.name).to eq('Timucuan')
    end

    it 'has an admission price' do
      expect(everglades.admission_price).to eq(35)
    end

    it 'can have a different admission price' do
      expect(timucuan.admission_price).to eq(5)
    end

    it 'has no vehicles' do
      expect(everglades.vehicles).to eq([])
    end
  end

  describe '#add_vehicle' do
    before do
      everglades.add_vehicle(vehicle)
    end

    it 'can add vehicles' do
      expect(everglades.vehicles).to eq([vehicle])
    end

    it 'does not affect other parks' do
      expect(timucuan.vehicles).to eq([])
    end
  end
end
