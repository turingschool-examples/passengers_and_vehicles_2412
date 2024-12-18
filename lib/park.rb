# frozen_string_literal: true

# Define a park with a name and admission price. Can hold vehicles.
class Park
  attr_reader :name, :price, :vehicles

  def initialize(name, price)
    @name = name
    @price = price
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    @vehicles.map(&:passengers).flatten
  end

  def revenue
    passengers.count(&:adult?) * @price
  end

  def patron_names
    passengers.map(&:name).sort
  end
end
