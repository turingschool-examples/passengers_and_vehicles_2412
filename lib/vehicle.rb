class Vehicle
    attr_reader :year, :make, :model, :passengers

    def initialize(year, make, model)
        @year = year
        @make = make
        @model = model
        @speed = 0
        @passengers = []
    end

    def speeding?
        if @speed > 60
            return true
        else
            return false
        end
    end

    def speed(mph)
        @speed += mph
    end

    def add_passenger(passenger)
        @passengers << passenger
    end

    def num_adults
        adults = @passengers.find_all { |passenger| passenger.adult? }
            adults.count
    end
end