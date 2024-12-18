class Passenger 
  attr_reader :name, :age, :driver

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @driver = false
  end

  def adult?
    if @age >= 18
      return true
    else
      return false
    end
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end
end