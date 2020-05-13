# Bridge

class Move
  def initialize(implementor)
    @implementor = implementor
  end
end 

class MoveRight < Move
  def move; end 
end

class MoveLeft < Move
  def move; end 
end

class MoveImplementor
  def move_right
    'moved right'
  end
  
  def move_left
    'mived left'
  end
end

class DrunkMoveImplementor < MoveImplementor
  def move_left
    3.times do super end
  end
end

class NormalMoveImplementor < MoveImplementor
  def move_right; end

  def move_left; end
end

