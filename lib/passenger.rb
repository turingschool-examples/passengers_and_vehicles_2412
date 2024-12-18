

class Passenger
  attr_reader :name

  def initialize(passenger_info)
    @name = passenger_info['name']
  end
end