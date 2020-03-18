class Customer

  attr_accessor :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @drinks = []
  end

  def pay(drink_price)
    @wallet -= drink_price
  end

  def drink_count()
    @drinks.size()
  end

  def take_drink(drink)
    @drinks.push(drink)
  end

end
