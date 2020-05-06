# Адаптер

# Типо левый код, интерфейс, который мы не можем
# изменить, но должны юзать 
class Rails
  def move
    'roling on rails)'
  end
end

# адаптируемая вещь 
class Car
  attr_accessor :adapter

  def initialize(adapter)
    @adapter = adapter
  end  
  
  def move
    'e-ron-don-don'
  end 
end    

# адаптер 

class CarAdapter
  attr_accessor :rails 

  def initialize(rails)
    @rails = rails 
  end  
end     

# создаем рельсы
rails = Rails.new

# создаем адаптер для рельс
adapter = CarAdapter.new(rails)

# применяем адаптер к машине
car = Car.new(adapter)

# поехали)
car.move
