class Park
    attr_reader :park_name, 
                :entry_fee, 
                :vehicles, 
                :passengers, 
                :revenue, 
                :patron_names,
                :minors,
                :adults

    def initialize(park_details)
        @park_name = park_details[:park_name]
        @entry_fee = park_details[:entry_fee]
        @vehicles = []
        @passengers = []
    end

    def add_vehicle(vehicle)
        @vehicles << vehicle
    end

    def passengers
        # @vehicles.each do |vehicle|
        #     @passengers << vehicle.passengers
        # end

        # @passengers.flatten

        @vehicles.each do |vehicle|
            vehicle.passengers.each do |passenger|
                @passengers << passenger
            end
        end

        @passengers
    end

    def revenue
        @revenue = 0

        @vehicles.each do |vehicle|
            @revenue = vehicle.num_adults * @entry_fee
        end

        @revenue
    end

    def patron_names #I couldn't for the life of me figure out why 
    #I couldn't get this to work. Same with the other two and using passenger.
    #I moved on for the last two tests andfound round about solutions for them at least. 
    #I bet it is something done that will haunt me forever
        # @patron_names = []

        # passengers.each do |passenger|
        #     @patron_names << passenger.name
        # end

        @patron_names = []

        @passengers.each do |passenger|
            @patron_names << passenger.name
        end

        @patron_names
    end

    def minors
        @minors = 0

        # @passengers.each do |passenger|
        #     if passenger.adult? == false
        #         @minors += 1
        #     end
        # end

        @vehicles.each do |vehicle|
            @minors = vehicle.passengers.count - vehicle.num_adults
        end

        @minors
    end

    def adults
        @adults = 0

        # @passengers.each do |passenger|
        #     if passenger.adult? == true
        #         adults += 1
        #     end
        # end

        @vehicles.each do |vehicle|
            @adults += vehicle.num_adults
        end

        @adults
    end
end