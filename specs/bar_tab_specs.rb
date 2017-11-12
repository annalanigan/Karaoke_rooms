require("minitest/autorun")
require("minitest/rg")
require_relative("../bar_tab.rb")
require_relative("../guest.rb")

class TestBarTab < MiniTest::Test

  def setup
    @bar1 = BarTab.new
    @guest1 = Guest.new("Anna", 100, @song1)
  end

  def test_bar_tab
    assert_equal(0, @bar1.tab)
  end

  def test_show_drinks_list
    assert_equal( {"beer"=>4, "wine"=>5, "fizz"=>6, "coke"=>2}, @bar1.show_drinks_list)
  end

  def test_take_fee
    @bar1.take_fee(10)
    assert_equal(10, @bar1.tab)
  end

  def test_sell_drink
    @bar1.sell_drink("fizz", @guest1)
    assert_equal(6, @bar1.tab)
    assert_equal(94, @guest1.wallet)
  end


end
