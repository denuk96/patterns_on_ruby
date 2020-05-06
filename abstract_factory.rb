# Абстрактная фабрика
# Проверить можно онлайн -> https://repl.it/languages/ruby
​
​
# абстрактная фабрика
​
class CarFabricBasic
​
end
​
# конкретная фабрика 1
class ElectricCarFabric < CarFabricBasic
  def create_bad_electric_car
    GigulElectric.new
  end
​
  def create_good_electric_car
    TeslaElectric.new
  end
end
​
# конкретная фабрика 2
class GasCarFabric < CarFabricBasic
  def create_bad_gas_car
    GigulGas.new
  end
​
  def create_good_gas_car
    TeslaGas.new
  end
end
​
# абстрактный продукт 1
​
class GasCar
 def initialize
   @engine = 'cheep engine'
 end
end 
​
# абстрактный продукт 2
​
class ElectricCar
  def initialize
    @engine = 'good engine'
  end
end
​
# Продукт 1
​
class GigulGas < GasCar
end
​
# Продукт 2
​
class TeslaElectric < ElectricCar
end
​
# продукт 3 (нанотехнологии)
​
class GigulElectric < ElectricCar
end 
​
# продукт 4 (как тебе такой, Илон?)
​
class TeslaGas < GasCar
end
​
# типа вызываем где-то в проекте
​
class AutoParkGas
  def initialize(fabric)
    @good_car = fabric.create_good_gas_car 
    @bad_car = fabric.create_bad_gas_car
  end
end
​
p AutoParkGas.new(GasCarFabric.new)
