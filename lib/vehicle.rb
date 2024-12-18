

class Vehicle

attr_reader :year, :make, :model

attr_accessor :speed, :passengers, :adults

    def initialize(year, make, model)
        @year = year
        @make = make
        @model = model
        @speeding = false
        @passengers = []
        @adults = 0
    end

    def speed
        @speeding = true
    end

    def speeding?
        if @speeding == true
            return true
        else
            return false
        end
    end

    def add_passenger(passenger)
        @passengers << passenger
    end

    def num_adults
        @passengers.each do |passenger|
            if passenger.age >= 18
                @adults += 1
            end
        end
        return @adults
    end
end