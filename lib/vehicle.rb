class Vehicle
  attr_reader :year, :make, :model, :passengers

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model

    @is_speeding = false
    @passengers = []
  end

  def speeding?()
    @is_speeding
  end

  def speed()
    #Wait a minute, aren't we all law-abiding citizens?
    @is_speeding = true
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults()
    #Run enumerable to check all passengers and tally
    @passengers.count { |passenger| passenger.adult?()}
  end

end
