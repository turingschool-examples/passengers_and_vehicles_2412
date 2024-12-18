class Park
    attr_reader :park_name, :entry_fee, :vehicles, :passengers, :revenue

    def initialize(park_details)
        @park_name = park_details[:park_name]
        @entry_fee = park_details[:entry_fee]
        @vehicles = []
    end

    def add_vehicle(vehicle)
        @vehicles << vehicle
    end

    def passengers
        @passengers = []

        @vehicles.each do |vehicle|
            @passengers << vehicle.passengers
        end

        @passengers.flatten
    end

    def revenue
        @revenue = 0

        @vehicles.each do |vehicle|
            @revenue = vehicle.num_adults * @entry_fee
        end

        @revenue
    end
end