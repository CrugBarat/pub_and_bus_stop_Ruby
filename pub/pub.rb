class Pub

  attr_reader :name, :till, :stock
  attr_writer :till

  def initialize(name, till, stock)
    @name = name
    @stock = stock
    @till = till
  end

  def till_count()
    @till
  end

  def stock_count()
    @stock.size()
  end

  def till_add_cash(customer, drink_price)
    customer.pay(drink_price)
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

  def add_drink_to_customer(customer, drink)
    remove_drink(drink)
    customer.take_drink(customer)
  end

  def drink_transaction(customer, drink)
    drink_price = drink.price
    add_drink_to_customer(customer, drink)
    till_add_cash(customer, drink_price)
  end

end
