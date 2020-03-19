class Customer

  attr_accessor :name, :wallet, :age, :drunkness

  def initialize(name, wallet, age, drunkness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkness = drunkness
  end

  def pay(price)
    @wallet -= price
  end

  def buy_drink(drink)
    drink_price = drink.price
    pay(drink_price)
    @drunkness += drink.alcohol_level
  end

  def buy_food(food)
    food_price = food.price
    pay(food_price)
    @drunkness -= food.rejuv_level
  end

end
