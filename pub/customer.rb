class Customer

  attr_accessor :name, :wallet, :age, :drunkness

  def initialize(name, wallet, age, drunkness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkness = drunkness
  end

  def pay(drink_price)
    @wallet -= drink_price
  end

  def buy_drink(drink, drink_price)
    drink_price = drink.price
    pay(drink_price)
    @drunkness += drink.alcohol_level
  end

end
