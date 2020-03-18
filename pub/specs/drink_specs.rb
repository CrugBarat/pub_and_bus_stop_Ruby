require('minitest/autorun')
require('minitest/reporters')
require_relative('../drink.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestDrink < Minitest::Test

  def setup()
    @drink = Drink.new("Beer", 5)
  end

  def test_get_name()
    assert_equal("Beer", @drink.name())
  end

  def test_set_name()
    @drink.name = "Gin"
    assert_equal("Gin", @drink.name())
  end

  def test_get_price()
    assert_equal(5, @drink.price())
  end

  def test_set_price()
    @drink.price = 6
    assert_equal(6, @drink.price())
  end

end
