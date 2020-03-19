require('minitest/autorun')
require('minitest/reporters')
require_relative('../food.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestFood < Minitest::Test

  def setup()
    @food = Food.new("Burger", 6, 25)
  end

  def test_get_name()
    assert_equal("Burger", @food.name())
  end

  def test_set_name()
    @food.name = "Taco"
    assert_equal("Taco", @food.name())
  end

  def test_get_price()
    assert_equal(6, @food.price())
  end

  def test_set_price()
    @food.price = 8
    assert_equal(8, @food.price())
  end

  def test_get_rejuv_level()
    assert_equal(25, @food.rejuv_level())
  end

  def test_set_rejuv_level()
    @food.rejuv_level = 15
    assert_equal(15, @food.rejuv_level())
  end

end
