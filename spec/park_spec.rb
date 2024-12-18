require 'rspec'
require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Park do
    before(:each) do
        @yosemite = Park.new({park_name: "Yosemite", entry_fee: 100})
    end

    describe 'initialize' do
        it 'is an instance of a park' do
            expect(@yosemite).to be_an_instance_of(Park)
        end
    end
end