# composite

class CoffeMacking 
  def initialize(task)
    @task = task
  end 

  def do_step(step)
    @steps << step
  end
end

# steps
class BoilWater < CoffeMacking
  def initialize
    super 'boil water'
  end  
end    

class GridCoffe < CoffeMacking
  def initialize
    super 'prepare coffe'
  end
end

class InjectMilk < CoffeMacking
  def initialize
    super 'add some milk'
  end
end

# compositing

class Esspresso < CoffeMacking
  def initialize
    super 'Macking Esspresso'
    @steps = []
    do_step(BoilWater.new)
    do_step(GridCoffe.new)
  end
end 

class AmericanoWithMilk < CoffeMacking
  def initialize
    super 'Macking Americano with milk'
    @steps = []
    do_step(BoilWater.new)
    do_step(GridCoffe.new)
    do_step(InjectMilk.new)
  end
end

p cup_of_esspresso = Esspresso.new
#<Esspresso:0x0000562bff9aef80 @task="Macking Esspresso", @steps=[#<BoilWater:0x0000562bff9aee90 @task="boil water">, #<GridCoffe:0x0000562bff9aee40 @task="prepare coffe">]>

p cup_of_esspresso = AmericanoWithMilk.new
#<AmericanoWithMilk:0x0000562bff9adab8 @task="Macking Americano with milk", @steps=[#<BoilWater:0x0000562bff9ad9a0 @task="boil water">, #<GridCoffe:0x0000562bff9ad8b0 @task="prepare coffe">, #<InjectMilk:0x0000562bff9ad7e8 @task="add some milk">]>
