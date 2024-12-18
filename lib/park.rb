

class Park

attr_reader :name, :price

attr_accessor :vehicles,
              :revenue, 
              :passengers, 
              :patrons

    def initialize(name, admission_price)
        @name = name
        @price = admission_price
        @vehicles = []
        @revenue = 0
        @passengers = []
        @patrons = []
    end

    def add_vehicle(vehicle)
        @passengers << vehicle.passengers
        @vehicles << vehicle
        @revenue += @price
        return @vehicles       
    end
    
    def patron_names
        @passengers.flatten.each do |passenger|
            @patrons << passenger.name
        end
        @patrons.sort
    end

    def minors
        minors = []
        @passengers.flatten.each do |passenger|
            if passenger.age < 18
                minors << passenger.name
            end
        end
        minors.sort
    end

    def adults
        adults = []
        @passengers.flatten.each do |passenger|
            if passenger.age >= 18
                adults << passenger.name
            end
        end
        adults.sort
    end
end