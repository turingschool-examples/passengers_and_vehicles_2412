class Park
  attr_reader :name, :price, :vehicles_in_park

  def initialize(name, price)
    @name = name
    @price = price.to_i         #Just to be sure it's an integer

    @vehicles_in_park = []
  end

  def add_vehicle(incoming_vehicle)
    @vehicles_in_park << incoming_vehicle
  end

  #Later: might want to provide a printing service as well to list vehicles on terminal? (Check)
  
end
