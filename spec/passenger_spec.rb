require './spec/spec_helper.rb'

RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'initializes' do
    expect(@charlie).to be_an_instance_of(Passenger)
    expect(@taylor).to be_an_instance_of(Passenger)
  end
  it 'has name' do
    expect(@charlie.name).to eq('Charlie')
    expect(@taylor.name).to eq('Taylor')
  end

  it 'has age' do
    expect(@charlie.age).to eq(18)
    expect(@taylor.age).to eq(12)
  end

  it 'is an adult?' do
    expect(@charlie.adult?).to eq(true)
    expect(@taylor.adult?).to eq(false)
  end

  it 'can drive' do
    expect(@charlie.driver?).to eq(false)
    expect(@taylor.driver?).to eq(false)

    @charlie.drive
    @taylor.drive

    expect(@charlie.driver?).to eq(true)
    expect(@taylor.driver?).to eq(false)
  end

end