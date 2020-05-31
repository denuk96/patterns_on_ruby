class Dice
  attr_accessor :name, :number

  def initialize(name)
    @name = name
    @number = rand(1..6)
  end

  def roll
    @number = rand(1..6)
  end  

  def save
    DicePosition.new self
  end

  def load(position)
    @name = position.name
    @nubmer = position.number
  end
end

class DicePosition
  attr_accessor :name, :number

  def initialize(dice)
    @name = dice.name
    @number = dice.number
  end
end

class DiceHistory
  attr_accessor :position, :number

  def initialize
    @positions = {}
    @position_number = 0
  end

  def add(position)
    @positions.store(@position_number, position)
    @position_number += 1
  end

  def position(number)
    @positions[number]
  end

  def possitions
    @positions
  end
end

# create dice
dice = Dice.new('first')
# create history
history = DiceHistory.new
# save dice
save_1 = dice.save
# add save to history
history.add(save_1)
# check it
history.position(0)
history.possitions
# => {0=>#<DicePosition:0x00005644acfec5f8 @name="first", @number=4>}

# roll dice 
dice.roll 
# save it 
save_2 = dice.save 
# add new one to history
history.add(save_2)
# and check it again 
p history.position(1)
history.possitions
# => {0=>#<DicePosition:0x000055e2d9d33670 @name="first", @number=3>, 1=>#<DicePosition:0x000055e2d9d31910 @name="first", @number=1>}

# load position
p dice.load(save_1)