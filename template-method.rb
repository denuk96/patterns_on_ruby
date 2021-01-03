#Template Method

class VehicleAbstract
  def initialize(*args)
    model = args[:model]
  end

  def move
    turn_on_engine
    moving
  end

  private

  def turn_on_engine
    raise 'abstract method'
  end

  def moving
    raise 'abstract method'
  end
end

# real class 1 without reordering publick methods, but with different implementation
class Car < VehicleAbstract
  private

  def turn_on_engine
    p 'vzh-vzh'
  end

  def moving
    p 'br-br'
  end
end

# real class 2 without reordering publick methods, but with different implementation
def Boat < VehicleAbstract
  private

  def turn_on_enginge
    p 'gr-gr'
  end

  def moving
    p 'blop-blop'
  end
end
