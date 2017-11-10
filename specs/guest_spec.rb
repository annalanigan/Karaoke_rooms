require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Anna", 100)
  end

  def test_guest_has_name
    assert_equal("Anna", @guest.name)
  end

  def test_guest_wallet
    assert_equal(100,@guest.wallet)
  end

  def test_make_payment
    assert_equal(90, @guest.make_payment(10))
  end

end
