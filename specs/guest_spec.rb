require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Anna")
  end

  def test_guest_has_name
    assert_equal("Anna", @guest.name)
  end

end
