require 'minitest/autorun'
require 'minitest/rg'
require_relative '../food'

class TestFood < MiniTest::Test

  def setup
    #(name, price, rejuv_level)
    @food1 = Food.new("burger", 8, 30)
    @food2 = Food.new("pizza", 7, 20)
    @food3 = Food.new("pie", 5, 10)
  end

  def test_food_has_name
    assert_equal("burger", @food1.name)
  end

  def test_food_has_price
    assert_equal(7, @food2.price)
  end

  def test_food_has_rejuv_level
    assert_equal(10, @food3.rejuv_level)
  end

end
