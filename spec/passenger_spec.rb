require './lib/passenger'

RSpec.describe Passenger do

  it 'returns a passenger exists' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    expect(charlie).to be_a(Passenger)
  end

  it 'retuns the name of the passenger' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    expect(charlie.name).to eq("Charlie")

  end

  it 'returns a passenger age' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    expect(charlie.age).to eq(18)


  end

  it 'determines whether passenger is or is not an adult' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    expect(charlie.adult?).to eq(true)
    expect(taylor.adult?).to eq(false)


  end
end
