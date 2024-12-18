# frozen_string_literal: true

require_relative 'spec_helper'

describe Passenger do
  subject(:charlie) { described_class.new({ 'name' => 'Charlie', 'age' => 18 }) }

  let(:taylor) { described_class.new({ 'name' => 'Taylor', 'age' => 12 }) }

  describe '#initialize' do
    it { is_expected.to be_an_instance_of(described_class) }

    it 'has a name' do
      expect(charlie.name).to eq('Charlie')
    end

    it 'can have a different name' do
      expect(taylor.name).to eq('Taylor')
    end

    it 'has an age' do
      expect(charlie.age).to eq(18)
    end

    it 'can have a different age' do
      expect(taylor.age).to eq(12)
    end

    it 'is not a driver' do
      expect(charlie.driver?).to be false
    end
  end

  describe '#adult?' do
    context 'when subject is an adult' do
      subject(:adult) { charlie.adult? }

      it { is_expected.to be true }
    end

    context 'when subject is not an adult' do
      subject(:adult) { taylor.adult? }

      it { is_expected.to be false }
    end
  end

  describe '#drive' do
    before do
      charlie.drive
    end

    it 'can set driver status' do
      expect(charlie.driver?).to be true
    end
  end
end
