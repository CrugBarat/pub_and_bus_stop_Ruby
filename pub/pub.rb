class Pub

  attr_reader :name, :till, :stock
  attr_writer :till

  def initialize(name, till, stock)
    @name = name
    @stock = stock
    @till = till
    @age_limit = 18
    @alcohol_limit = 50
  end

  def till_count()
    @till
  end

  def stock_count()
    @stock.size()
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

  def drink_transaction(customer, drink)
    drink_price = drink.price
    customer.buy_drink(drink, drink_price)
    till_add_cash(drink_price)
    remove_drink(drink)
  end

  def serve_drink(customer, drink)
    if check_age?(customer) == true
      if customer.drunkness < @alcohol_limit
      drink_transaction(customer, drink)
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

end
