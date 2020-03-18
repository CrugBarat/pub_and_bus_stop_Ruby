require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCustomer < Minitest::Test

  def setup()
  @customer = Customer.new("Frank", 40)
  @drink1 = Drink.new("Beer", 5)
  @drink2 = Drink.new("Gin", 8)
  @stock = [@drink1, @drink2]
  @pub = Pub.new("The Duck's Bill", 75, @stock)
  end

  def test_get_name()
    assert_equal("Frank", @customer.name())
  end

  def test_set_name()
    @customer.name = "John"
    assert_equal("John", @customer.name())
  end

  def test_get_wallet()
    assert_equal(40, @customer.wallet())
  end

  def test_set_wallet()
    @customer.wallet = 100
    assert_equal(100, @customer.wallet())
  end

  def test_pay()
    @customer.pay(5)
    assert_equal(35, @customer.wallet())
  end

  def test_drinks__empty()
    assert_equal(0, @customer.drink_count())
  end

  def test_take_drink()
    drink = Drink.new("Vodka", 3)
    @customer.take_drink(drink)
    assert_equal(1, @customer.drink_count())
  end

end
