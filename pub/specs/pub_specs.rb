require('minitest/autorun')
require('minitest/reporters')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPub < Minitest::Test

  def setup()
    @customer1 = Customer.new("John", 100)
    @customer2 = Customer.new("Albert", 45)
    @drink1 = Drink.new("Beer", 5)
    @drink2 = Drink.new("Gin", 8)
    @drink3 = Drink.new("Rum", 4)
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
    @pub.till_add_cash(@customer1, 5)
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
  end

  def test_multiple_drink_transactions()
    @pub.drink_transaction(@customer1, @drink1)
    @pub.drink_transaction(@customer2, @drink2)
    assert_equal(0, @pub.stock_count())
    assert_equal(63, @pub.till_count())
    assert_equal(95, @customer1.wallet())
    assert_equal(37, @customer2.wallet())
  end


end
