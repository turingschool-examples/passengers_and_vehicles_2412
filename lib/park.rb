class Park
    attr_reader :name, :admission_price, :vehicles_in_park, :passengers_in_park

    def initialize(park_details)
        @name = park_details["name"]
        @admission_price = park_details["admission price"]
        @vehicles_in_park = []
        @passengers_in_park = []
    end

    def add_vehicle(vehicle)
        @vehicles_in_park << vehicle
    end

    def add_passenger(passenger)
        @passengers_in_park << passenger
    end

    def revenue
        total = @passengers_in_park.find_all { |passenger| passenger.adult?}
        total.count
        (total.count)*(@admission_price)
    end

    def patron_names
        names = @passengers_in_park.map { |passenger| passenger.name}
        names.sort
    end

    def minors
        minors = @passengers_in_park.find_all { |passenger| !passenger.adult?}
        minors.map { |passenger| passenger.name }
    end

    def adults
        adults = @passengers_in_park.find_all { |passenger| passenger.adult?}
        adults.map { |passenger| passenger.name }
    end
end