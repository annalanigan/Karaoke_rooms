require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestGuest < MiniTest::Test

  def setup
    @fav_song = Song.new("Life on Mars", "Zhavid Bowie")
    @guest = Guest.new("Anna", 100, @fav_song)
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

  def test_favoutite_song
    assert_equal("Life on Mars", @guest.favourite_song.title)
  end

  def test_cheer
    assert_equal("Ya Dancer!", @guest.cheer(@fav_song))
  end

end
