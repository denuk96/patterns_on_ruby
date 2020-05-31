class Seller
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def use_agency(agency, house)
    agency.register(house)
  end

  def name
    @name
  end
end

class Buyer
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def use_agency(agency)
    @agency = agency
  end

  def buy(house)
    @agency.purchase(house, self)
  end

  def name
    @name
  end
end

class House
  attr_reader :owner

  def initialize(owner)
    @owner = owner
  end

  def owner
    @owner
  end

  def new_owner(buyer)
    @owner = buyer
  end
end

# Mediator
class Agency
  def initialize
    @houses = []
  end

  def register(house)
    @houses << house
  end

  def purchase(house, buyer)
    house.new_owner buyer
  end
end

buyer = Buyer.new('boba')
seller = Seller.new('biba')
house = House.new(seller)
house.owner.name
#=> "biba"

agency = Agency.new
seller.use_agency(agency, house)
buyer.use_agency(agency)
buyer.buy(house)

house.owner.name
#=> "biba"