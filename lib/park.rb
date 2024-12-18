class Park
    attr_reader :name, :price, :vehicles, :passengers

    def initialize(info)
        @name = info[:name]
        @price = info[:price]
        @vehicles = []
        @passengers = []
    end

    def add_vehicle(vehicle)
        @vehicles << vehicle 
        vehicle.passengers.each do |passenger|
            @passengers << passenger
        end
    end

    def revenue
        collection = 0

        @passengers.each do |passenger|
            if passenger.adult?
                collection += @price
            end
        end
        collection
    end

    def list_visitor_names
        @passengers.map do |passenger|
            passenger.name
        end
    end

    def list_vehicle_names
        @vehicles.map do |vehicle|
            "#{vehicle.make} #{vehicle.model}"
        end
    end
end