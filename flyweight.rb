# The Flyweight class
class Car
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

# Flyweight Factory
class TaxiStation
  def initialize
    @group = {}
  end

  def find_car(color)
    if @group.has_key?(color)
      car = @group[color]
    else
      car = create_car(color)
      @group[color] = car
    end
  end

  def group
    @group
  end  

  def group_size
    @group.size
  end  

  private 

  def create_car(color)
    Car.new(color)
  end
end

# Flyweight Context
class Region 
  attr_accessor :taxi_station

  def initialize
    @taxi_station = TaxiStation.new
    @groups = []
  end

  def add_car(color)
    car = @taxi_station.find_car(color)
    @groups << car
  end
end 

region = Region.new
region.add_car('red')
region.add_car('blue')
region.add_car('white')