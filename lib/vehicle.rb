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
    @is_speeding = true
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

end
