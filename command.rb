require 'singleton'
​
class Car
  attr_accessor :id, :model
​
  def initialize(id, model)
    @id = id
    @model = model
  end
end
​
class AutoPark
  include Singleton
  attr_reader :cars
​
  def initialize
    @cars = {}
  end
​
  def add_car(car)
    @cars[car.id] = car
  end
​
  def delete_car(id)
    @cars.delete(id)
  end
​
  def find_car(id)
    @cars[id]
  end
​
  def all_cars
    @cars 
  end
end
​
class AbstractCommand
  attr_reader :system
​
  def initialize(args = {}, system = AutoPark.instance)
    @system = system
    post_initialize(args)
  end
end
​
class AddCar < AbstractCommand
  attr_reader :car
​
  def execute
    system.add_car(car)
  end
​
  def unexecute
    system.delete_car(car.id)
  end
​
  private
​
  def post_initialize(car)
    @car = car
  end
end
​
class DeleteCar < AbstractCommand
  attr_reader :id
​
  def execute
    @cars = system.find_car(id).to_a
    system.delete_car(id)
  end
​
  private
​
  def post_initialize(id)
    @id = id
    @cars = nil
  end
end
​
​
​
​
tesla = Car.new(1, 'tesla')
volga = Car.new(2, 'volga')
ford = Car.new(3, 'ford')
​
add_tesla = AddCar.new(tesla)
add_tesla.execute
AutoPark.instance.all_cars
#=> {1=>#<Car:0x0000561c405fb470 @id=1, @model="tesla">}
add_tesla.unexecute
# => {}
​
add_tesla.execute
​
add_volga = AddCar.new(volga)
add_volga.execute
​
add_ford = AddCar.new(ford)
add_ford.execute
​
AutoPark.instance.all_cars
​
# => {1=>#<Car:0x00005562c7cd6638 @id=1, @model="tesla">, 2=>#<Car:0x00005562c7cd64a8 @id=2, @model="volga">, 3=>#<Car:0x00005562c7cd6390 @id=3, @model="ford">}
​
add_volga.unexecute
​
AutoPark.instance.all_cars
# => {1=>#<Car:0x00005646c0412a78 @id=1, @model="tesla">, 3=>#<Car:0x00005646c04127f8 @id=3, @model="ford">}
