# Decorator

class Car
  def initialize(model, engine)
    @model = model
    @engine = engine
    @color = 'white'
  end
end    

class CarColorDecorator < SimpleDelegator
  def paint_to(color)
    color
  end  
end

class CarEngineDecorator < SimpleDelegator
  def add_engine(engine)
    engine
  end   
end    
  
car = Car.new('tesla', 'elect')
car = CarColorDecorator.new(car)
car = CarEngineDecorator.new(car)
  
p car.paint_to('red')
p car.add_engine('gas')
