require 'minitest/autorun'
require 'minitest/rg'
require_relative '../customers'
require_relative '../drink'
require_relative '../food'

class TestCustomers < MiniTest::Test

  def setup
    @drink1 = Drink.new("beer", 2, 10)
    @drink2 = Drink.new("wine", 3, 20)
    @food1 = Food.new("burger", 8, 30)
    @food2 = Food.new("pizza", 7, 20)
    @food3 = Food.new("pie", 5, 10)
    @customer1 = Customer.new("Andrew", 10, 26, 0)
    @customer2 = Customer.new("Katie", 15, 25, 0)
  end

  def test_customer_has_name
    assert_equal("Andrew", @customer1.name)
  end

  def test_customer_has_money
    assert_equal(15, @customer2.wallet)
  end

  def test_customer_has_age
    assert_equal(26, @customer1.age)
  end

  def test_has_bought_drink
    @customer2.buy_drink(@drink2)
    assert_equal(12, @customer2.wallet)
  end

  def test_customer_drunkenness
    assert_equal(0, @customer2.drunkenness)
  end

  def test_customer_drunkenness_after_drink
    @customer2.drinks_drink(@drink2)
    assert_equal(20, @customer2.drunkenness)
  end

  def test_customer_has_bought_food
    @customer2.buys_food(@food1)
    assert_equal(-30, @customer2.drunkenness)
    assert_equal(7, @customer2.wallet)
  end

end
