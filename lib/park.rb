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
        passengers = []
        @vehicles.each { |vehicle| passengers << vehicle.passengers }
        passengers.flatten
    end

    def revenue
        passengers.find_all(&:adult?).size * @price
    end

    def patron_names
        passengers.map(&:name)
    end

    def minors
        passengers.find_all{ |passenger| !passenger.adult? }.map(&:name)
    end

    def adults
        passengers.find_all{ |passenger| passenger.adult? }.map(&:name)
    end
end