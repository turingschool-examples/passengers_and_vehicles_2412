require './lib/passenger.rb'

RSpec.describe Passenger do
    describe "initialization" do
        it "can create a passenger" do
            charlie = Passenger.new({"name"=>"Charlie","age"=>18})

            expect(charlie).to be_a(Passenger)
            expect(charlie.name).to eq("Charlie")
            expect(charlie.age).to eq(18)
        end
    end

    describe "adult?" do
        it "can determine if passenger is an adult" do
            charlie = Passenger.new({"name"=>"Charlie","age"=>18})

            expect(charlie.adult?).to eq(true)
        end
    end

    describe "drive" do
        it "can determine if a passenger is the driver" do
            charlie = Passenger.new({"name"=>"Charlie","age"=>18})

            expect(charlie.driver?).to eq(false)
        end
    end
end