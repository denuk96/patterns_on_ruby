# Фабричный метод
# Проверить можно онлайн -> https://repl.it/languages/ruby
​
​
# обьявляем пустой фабричный класс (абстрактная фабрика)
​
class CarBasic
  def add_cool_engine; end
​
  def paint_car; end
end
​
# конкретная фабрика 1
class ElectricCar < CarBasic
  def initialize
    @engine = 'Electric engine' 
  end
​
  def add_cool_engine
    @engine = 'Cool Electric engine' 
  end
​
   def paint_car
  end
end
​
# конкретная фабрика 2
class GasCar < CarBasic
  def initialize
    @engine = 'Gas engine' 
  end
​
   def add_cool_engine
    @engine = 'Cool Gas engine' 
  end
​
   def paint_car
  end
end
​
# создаем экземпляр класса, который унаследован от абстрактной фабрики 1
p el_car = ElectricCar.new
p el_car.add_cool_engine
​
# и для второй фабрики
p gas_car = GasCar.new
p gas_car.add_cool_engine
​
# интерфейс тот же - реализация разная
