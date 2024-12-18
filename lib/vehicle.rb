class Vehicle
    attr_reader :year, :make, :model, :passengers
  
    def initialize(year, make, model)
      @year = year
      @make = make
      @model = model
      @speed = false
      @passengers = []
      @num_adults = num_adults
    end
  
    def speeding?
      @speed
    end
  
    def speed
      @speed = true
    end

    def add_passenger(passenger)
        @passengers << passenger
    end

    def num_adults
       
        @passengers.find_all { |passenger| passenger.adult? }.length
    end
end
  