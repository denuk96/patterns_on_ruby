# BUILDER
# check it out -> https://repl.it/languages/ruby
​
class CarBuilder
  def make_wheel
    raise 'abstact method'
  end
​
  def make_door
    raise 'abstact method'
  end
​
  def make_engine
    raise 'abstact method'
  end
end
​
# concrete builder
​
class ConcreteBuilder < CarBuilder
  def initialize
    @car = Car.new
  end
​
  def make_wheel
    @car.add('wheel')
  end
​
  def make_door
    @car.add('door')
  end
​
  def make_engine
    @car.add('engine')
  end
end
​
# product
​
class Car
   def initialize
     @parts = []
   end

   def add(part)
    @parts << part
   end
end
​
# director to manage a production
​
class Director
  attr_reader :fabric
​
  def initialize(fabric)
    @fabric = fabric
  end
​
  def build_coupe
    2.times do fabric.make_door end
    4.times do fabric.make_wheel end
    1.times do fabric.make_engine end
  end
​
  def build_sedan_double_engine
    4.times do fabric.make_door end
    4.times do fabric.make_wheel end
    2.times do fabric.make_engine end
  end
end
​
p builder = ConcreteBuilder.new
p director = Director.new(builder)
​
p car1 = director.build_coupe
p car2 = director.build_sedan_double_engine
