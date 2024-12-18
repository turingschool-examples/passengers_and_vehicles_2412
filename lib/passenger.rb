class Passenger
    attr_reader :name, :age, :driver

    def initialize(passenger_details)
        @name = passenger_details[:name]
        @age = passenger_details[:age]
        @driver = false
    end

    def adult?
        @age >= 18
        # if age >= 18
        #     true
        # else
        #     false
        # end
    end

    def driver?
        @driver
    end

    def drive
        if @age >= 18
            @driver = true
        else
            @driver = false
        end
    end
end