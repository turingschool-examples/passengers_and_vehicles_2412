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
      expect(everglades.price).to eq(35)
    end

    it 'can have a different admission price' do
      expect(timucuan.price).to eq(5)
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

  describe '#passengers' do
    context 'when no passengers have been added' do
      it 'has no passengers' do
        expect(everglades.passengers).to eq([])
      end
    end

    context 'when passengers have been added' do
      before do
        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)

        everglades.add_vehicle(vehicle)
      end

      it 'lists all passengers' do
        expect(everglades.passengers).to eq([charlie, jude, taylor])
      end
    end
  end

  describe '#revenue' do
    context 'when no visitors have entered' do
      it 'has no revenue' do
        expect(everglades.revenue).to eq(0)
      end
    end

    context 'when visitors have entered' do
      before do
        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(taylor)

        everglades.add_vehicle(vehicle)
      end

      it 'calculates correct revenue' do
        expect(everglades.revenue).to eq(70)
      end
    end
  end

  describe '#patron_names' do
    context 'when no visitors have entered' do
      it 'has no patrons' do
        expect(everglades.patron_names).to eq([])
      end
    end

    context 'when visitors have entered' do
      before do
        vehicle.add_passenger(taylor)
        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)

        everglades.add_vehicle(vehicle)
      end

      it 'lists all patron names alphabetically' do
        expect(everglades.patron_names).to eq(%w[Charlie Jude Taylor])
      end
    end
  end

  describe '#minors' do
    context 'when no visitors have entered' do
      it 'has no minors' do
        expect(everglades.minors).to eq([])
      end
    end

    context 'when visitors have entered' do
      before do
        brad = Passenger.new({ 'name' => 'Brad', 'age' => 14 })
        vehicle.add_passenger(taylor)
        vehicle.add_passenger(charlie)
        vehicle.add_passenger(jude)
        vehicle.add_passenger(brad)

        everglades.add_vehicle(vehicle)
      end

      it 'lists all minor names alphabetically' do
        expect(everglades.minors).to eq(%w[Brad Taylor])
      end
    end
  end
end
