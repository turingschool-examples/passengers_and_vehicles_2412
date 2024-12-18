require 'pry'
class Passenger
    attr_reader :name, :age, :drive

    def initialize(passenger_details)
        @name = passenger_details["name"]
        @age = passenger_details["age"]
    end

    def adult?
        if @age >= 18
            return true
        else
            return false
        end
    end

    def drive
        if adult? == true
            return true
        else
            return false
        end
    end
    
    def driver?
        if drive == true
            return true
        else
            return false
        end
    end
end