require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCustomer < Minitest::Test

  def setup()
  @customer = Customer.new("Frank", 40, 45, 15)
  @drink1 = Drink.new("Beer", 5, 5)
  @drink2 = Drink.new("Gin", 8, 10)
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

  def test_get_drunkness()
    assert_equal(15, @customer.drunkness())
  end

  def test_set_drunkness()
    @customer.drunkness = 40
    assert_equal(40, @customer.drunkness())
  end

  def test_buy_drink()
    @customer.buy_drink(@drink1, 5)
    assert_equal(20, @customer.drunkness())
    assert_equal(35, @customer.wallet())
  end

  def test_buy_multiple_drinks()
    @customer.buy_drink(@drink1, 5)
    @customer.buy_drink(@drink2, 8)
    assert_equal(30, @customer.drunkness())
    assert_equal(27, @customer.wallet())
  end

end
