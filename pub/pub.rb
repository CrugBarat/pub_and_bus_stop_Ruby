class Pub

  attr_reader :name, :till, :stock, :food_menu
  attr_writer :till

  def initialize(name, till, stock, food_menu)
    @name = name
    @stock = stock
    @till = till
    @food_menu = food_menu
    @age_limit = 18
    @alcohol_limit = 50
  end

  def till_count()
    @till
  end

  def stock_count()
    @stock.size()
  end

  def food_count()
    @food_menu.size()
  end

  def till_add_cash(drink_price)
    @till += drink_price
  end

  def till_remove_cash(amount)
    @till -= amount
  end

  def remove_drink(drink)
    @stock.delete(drink)
  end

  def add_drink(drink)
    @stock << drink
  end

  def customer_can_afford_drink(customer, drink)
    drink_price = drink.price
    customer.wallet() > drink_price
  end

  def customer_can_afford_food(customer, food)
    food_price = food.price
    customer.wallet() > food_price
  end

  def drink_transaction(customer, drink)
    drink_price = drink.price
    customer.buy_drink(drink)
    till_add_cash(drink_price)
    remove_drink(drink)
  end

  def serve_drink(customer, drink)
    if customer_can_afford_drink(customer, drink) == true
      if check_age?(customer) == true
        if customer.drunkness < @alcohol_limit
          drink_transaction(customer, drink)
        end
      end
    end
  end

  def check_age?(customer)
    if customer.age >= @age_limit
      return true
    else
      return false
    end
  end

  def sell_food(customer, food)
    food_price = food.price
    if customer_can_afford_food(customer, food) == true
      @food_menu.delete(food)
      customer.buy_food(food)
      till_add_cash(food_price)
    end
  end

end
