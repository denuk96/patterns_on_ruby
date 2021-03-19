# Visitor

# components should be visited

class Bank
  def accept(visitor)
    visitor.visit_bank(self)
  end
end

class Appartment
  def accept(visitor)
    visitor.visit_appartment(self)
  end
end

class Fabric
  def accept(visitor)
    visitor.visit_fabric(self)
  end
end

# visitor

class Visitor
  def visit_bank(bank)
    p bank
    p 'bank visited'
  end

  def visit_appartment(appartment)
    p appartment
    p 'appartment visited'
  end

  def visit_fabric(fabric)
    p fabric
    p 'fabric visited'
  end
end

# client code
components = [Bank.new, Appartment.new, Fabric.new]
visitor = Visitor.new

components.each do |component|
  component.accept(visitor)
end
