require 'minitest/autorun'
require 'minitest/rg'
require_relative '../pub'
require_relative '../drink'
require_relative '../customers'
require_relative '../food'

class TestPub < MiniTest::Test

  def setup
    @drink1 = Drink.new("beer", 2, 10)
    @drink2 = Drink.new("wine", 3, 20)
    @food1 = Food.new("burger", 8, 30)
    @food2 = Food.new("pizza", 7, 20)
    @food3 = Food.new("pie", 5, 10)
    @customer1 = Customer.new("Andrew", 10, 26, 0)
    @customer2 = Customer.new("Katie", 15, 17, 0)
    @pub = Pub.new("Chanter", 1000, [
      {
        drink: @drink1,
        stock: 300
      },
      {
        drink: @drink2,
        stock: 200
      }
      ])
  end

  def test_pub_has_name
    assert_equal("Chanter", @pub.name)
  end

  def test_pub_has_money
    assert_equal(1000, @pub.till)
  end

  def test_pub_has_stock
    assert_equal(2, @pub.drinks.length)
  end

  def test_sell_drink
    @pub.sell_drink(@drink2)
    assert_equal(1003, @pub.till)
  end

  def test_check_customer_age
    @pub.check_age(@customer1, @drink1)
    assert_equal(8, @customer1.wallet)
  end

  def test_customer_too_young
    result = @pub.check_age(@customer2, @drink2)
    assert_equal("Too young!", result)
    assert_equal(15, @customer2.wallet)
  end

  def test_refuse_service_too_drunk
    3.times {@customer1.drinks_drink(@drink2)}
    result1 = @pub.check_drunkenness_level(@customer1)
    result2 = @pub.check_drunkenness_level(@customer2)
    assert_equal("Here's your drink!", result2)
    assert_equal("Go home!", result1)
  end

  def test_sells_food
    @pub.sells_food(@customer2, @food1)
    assert_equal(1008, @pub.till)
  end

  def test_drink_has_stock_level
    assert_equal(300, @pub.drinks[0][:stock])
  end

  def test_stock_value
    assert_equal(500, @pub.stock_value)
  end

  def test_customer_can_afford
    assert_equal(true, @pub.customer_can_afford(@customer1, @food1))
  end

end
