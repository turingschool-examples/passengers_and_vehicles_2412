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

    def all_passengers
        total_passengers = []
        @vehicles.each do |vehicle|
            total_passengers.????????
        end
    end

end         