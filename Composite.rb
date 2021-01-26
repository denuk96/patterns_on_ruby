# composite

class Item
  attr_accessor :name, :price

  def initialize(name, price)
    @name, @price = name, price
  end
end

class Order
  attr_reader :sub_order, :items

  def initialize
    @items = []
    @sub_order = []
  end

  def add_order order
    self if sub_order << order
  end

  def remove_order order
    self if sub_order.remove order
  end

  def add_item item
    self if items << item
  end

  def remove_item item
    self if items.remove item
  end

  def summary
    items_summary = items.map(&:price).reduce(:+) || 0
    orders_summary = sub_order.map(&:summary).reduce(:+) || 0
    items_summary + orders_summary
  end
end

item1 = Item.new('item 1', 5)
item2 = Item.new('item 2', 10)
order1 = Order.new.add_item(item1).add_item(item2)
order2 = Order.new.add_item(item1).add_order(order1)
p order1.summary # 15
p order2.summary # 20
