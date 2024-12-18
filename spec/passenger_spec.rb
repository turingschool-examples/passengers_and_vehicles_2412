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
end