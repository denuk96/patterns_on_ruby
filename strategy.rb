# sort of client code
class Army
  def initialize
    @squad = {}
    @strategy = nil
  end
  
  def add_unit(unit)
    @squad[unit.name] = unit.attack_range
  end
  
  def units_possitions
    @squad
  end
  
  def change_strategy(strategy)
    @strategy = strategy
    @squad = @strategy.regroup(@squad)
  end

  def strategy
    @strategy ? @strategy.name : 'doesnt have any strategy'
  end  
end

# abstarct strategy
class Strategy
  def regroup(squad); end

  def name; end
end

# concrete stategy 1
class RangeFirstStrategy < Strategy
  def regroup(squad)
    squad.sort_by(&:first).to_h
  end

  def name
    'range first'
  end  
end 

#concrete stategy 2
class MeleeFristStrategy < Strategy
  def regroup(squad)
    squad.sort_by(&:last).to_h
  end

  def name
    'melee first'
  end
end 
 
class Warrior
  def initialize(name)
    @name = name
  end 

  def name
    @name
  end 

  def attack_range
    @attack_range
  end  
end 
 
class Swordsman < Warrior
  def initialize(name)
    super
    @attack_range = 1
  end  
end 

class Archer < Warrior
  def initialize(name)
    super
    @attack_range = 2
  end  
end

class Ballista < Warrior
  def initialize(name)
    super
    @attack_range = 3
  end  
end

army = Army.new
ork = Swordsman.new('myaso')
elf = Archer.new('legolas')
ballista = Ballista.new('katapulta')

army.add_unit(ork)
army.add_unit(ballista)
army.add_unit(elf)

army.units_possitions
# => {"myaso"=>1, "katapulta"=>3, "legolas"=>2}

army.change_strategy(RangeFirstStrategy.new)
army.strategy
# => "range first"
army.units_possitions
# => {"katapulta"=>3, "legolas"=>2, "myaso"=>1}

army.change_strategy(MeleeFristStrategy.new)
army.strategy
# => "melee first"
army.units_possitions
# => {"myaso"=>1, "legolas"=>2, "katapulta"=>3}   
