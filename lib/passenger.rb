# Use TDD to create a Passenger class that responds to the following interaction pattern.
# For the adult? method, a Passenger is considered an adult if they are age 18 or older.


require './lib/passenger'
require 'pry'


class Passenger #class being created
    attr_reader :name, :age 
    #attr reader to be able to access the symbol name and age that are being passed in the initialize method

    def initialize(details) #initialize method that takes in a hash called details
        @name = details["name"] #instance variable name is equal to the value of the key name in the hash details
        @age = details["age"] #instance variable age is equal to the value of the key age in the hash details
        @driver = false #instance variable driver is equal to false
    end

    def adult?
        @age >= 18 #if the age is greater than or equal to 18, return true
    end

    def driver?
        @driver #return the value of the instance variable driver
    end

    def drive
        @driver = true #change the value of the instance variable driver to true
    end
end