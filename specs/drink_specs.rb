require 'minitest/autorun'
require 'minitest/rg'
require_relative '../drink'

class TestDrinks < MiniTest::Test

  def setup
    @drink1 = Drink.new("beer", 2, 10)
    @drink2 = Drink.new("wine", 3, 20)
  end

  def test_drink_has_name
    assert_equal("beer", @drink1.name)
  end

  def test_drink_has_price
    assert_equal(3, @drink2.price)
  end

  def test_drink_has_alcohol_level
    assert_equal(20, @drink2.alcohol_level)
  end


end
