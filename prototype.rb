class SomeClass
  def initialize
    @a = 1  
  end
​
  def method(int)
    @a = @a + 1
  end  
end
​
a = SomeClass.new
b = a.clone
​
a.method(1)
​
p a
p b

