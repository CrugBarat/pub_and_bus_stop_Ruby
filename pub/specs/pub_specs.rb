require('minitest/autorun')
require('minitest/reporters')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPub < Minitest::Test

  def setup()
    @customer1 = Customer.new("John", 100, 33, 30)
    @customer2 = Customer.new("Albert", 45, 16, 5)
    @customer3 = Customer.new("Frank", 75, 48, 55)
    @drink1 = Drink.new("Beer", 5, 5)
    @drink2 = Drink.new("Gin", 8, 10)
    @drink3 = Drink.new("Rum", 4, 15)
    @stock = [@drink1, @drink2]
    @pub = Pub.new("The Horse's Hoof", 50, @stock)
  end

  def test_get_name()
    assert_equal("The Horse's Hoof", @pub.name())
  end

  def test_get_till()
    assert_equal(50, @pub.till())
  end

  def test_set_till()
    @pub.till = 100
    assert_equal(100, @pub.till())
  end

  def test_get_stock
    assert_equal(@stock, @pub.stock())
  end

  def test_check_stock()
    assert_equal(2, @pub.stock_count())
  end

  def test_till_can_add_cash()
    @pub.till_add_cash(5)
    assert_equal(55, @pub.till_count())
  end

  def test_till_can_remove_cash()
    @pub.till_remove_cash(25)
    assert_equal(25, @pub.till_count())
  end

  def test_can_remove_drink_from_stock()
    @pub.remove_drink(@drink1)
    assert_equal(1, @pub.stock_count())
  end

  def test_can_add_drink_to_stock()
    @pub.add_drink(@drink3)
    assert_equal(3, @pub.stock_count())
  end

  def test_drink_transaction()
    @pub.drink_transaction(@customer1, @drink1)
    assert_equal(1, @pub.stock_count())
    assert_equal(55, @pub.till_count())
    assert_equal(95, @customer1.wallet())
    assert_equal(35, @customer1.drunkness())
  end

  def test_multiple_drink_transactions()
    @pub.drink_transaction(@customer1, @drink2)
    @pub.drink_transaction(@customer2, @drink1)
    assert_equal(0, @pub.stock_count())
    assert_equal(63, @pub.till_count())
    assert_equal(92, @customer1.wallet())
    assert_equal(40, @customer2.wallet())
    assert_equal(40, @customer1.drunkness())
    assert_equal(10, @customer2.drunkness())
  end

  def test_serve_drink__success()
    @pub.serve_drink(@customer1, @drink2)
    assert_equal(58, @pub.till_count())
    assert_equal(1, @pub.stock_count())
    assert_equal(92, @customer1.wallet())
    assert_equal(40, @customer1.drunkness())
  end

  def test_serve_drink__fail()
    @pub.serve_drink(@customer2, @drink1)
    assert_equal(50, @pub.till_count())
    assert_equal(2,@pub.stock_count())
    assert_equal(45, @customer2.wallet())
    assert_equal(5, @customer2.drunkness())
  end

  def test_multiple_serve_drinks()
    @pub.serve_drink(@customer1, @drink1)
    @pub.serve_drink(@customer2, @drink2)
    assert_equal(55, @pub.till_count())
    assert_equal(1, @pub.stock_count())
    assert_equal(95, @customer1.wallet())
    assert_equal(45, @customer2.wallet())
    assert_equal(35, @customer1.drunkness())
    assert_equal(5, @customer2.drunkness())
  end

  def test_customers_age__serve()
    assert_equal(true, @pub.check_age?(@customer1))
  end

  def test_customers_age__refuse()
    assert_equal(false, @pub.check_age?(@customer2))
  end

  def test_customer_drunkness()
    @pub.serve_drink(@customer3, @drink1)
    assert_equal(50, @pub.till_count())
    assert_equal(2, @pub.stock_count())
    assert_equal(75, @customer3.wallet())
    assert_equal(55, @customer3.drunkness())
  end

end
