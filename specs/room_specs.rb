require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../bar_tab.rb")

class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Anna", 100, @song1)
    @guest2 = Guest.new("Gaelle", 50, @song2)
    @guest3 = Guest.new("Angie", 5, @song3)
    @song1 = Song.new("Life on Mars", "Zhavid Bowie")
    @song2 = Song.new("Rooting For You", "London Grammar")
    @song3 = Song.new("My Type", "Saint Motel")
    @bar1 = BarTab.new
    @room1 = Room.new("Rock Room", 10, @bar1)
    @room2 = Room.new("Lala Land", 5, @bar1)
    @room3 = Room.new("Crowded House", 3, @bar1)
  end

  def test_room_has_name
    assert_equal("Rock Room", @room1.name)
  end

  def test_room_has_guests__two
    @room1.checkin_guest(@guest1)
    @room1.checkin_guest(@guest2)
    assert_equal(2, @room1.guests.length)
  end

  def test_room_has_guests__empty
    assert_equal(0, @room2.guests.length)
  end

  def test_room_has_songs__two
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal(2, @room1.playlist.length)
  end

  def test_room_has_songs__empty
    assert_equal(0, @room2.playlist.length)
  end

  def test_checkin_guest
    @room2.checkin_guest(@guest1)
    assert_equal(1, @room2.guests.length)
  end

  def test_checkout_guest
    @room1.checkin_guest(@guest1)
    @room1.checkin_guest(@guest2)
    @room1.checkout_guest(@guest2)
    assert_equal(1, @room1.guests.length)
  end

  def test_add_song
    @room2.add_song(@song2)
    assert_equal(1, @room2.playlist.length)
  end

  def test_check_capacity
    assert_equal(10, @room1.capacity)
  end

  def test_checkin_too_many_guests
    @room3.checkin_guest(@guest1)
    @room3.checkin_guest(@guest2)
    @room3.checkin_guest(@guest1)
    @room3.checkin_guest(@guest2)
    assert_equal(3, @room3.guests.length)
  end

  def test_guest_paying_fee
    @room3.checkin_guest(@guest1)
    @room3.checkin_guest(@guest2)
    assert_equal(90, @guest1.wallet)
    assert_equal(40, @guest2.wallet)
  end

  def test_guest_pay__has_no_funds
    @room3.checkin_guest(@guest3)
    assert_equal(0, @room3.guests.length)
  end


  def test_room_tab
    assert_equal(0, @room1.bar_tab.tab)
  end

  def test_tab_after_checkin
    @room1.checkin_guest(@guest1)
    assert_equal(10, @room1.bar_tab.tab)
  end

  # def test_cheer_if_song_on_playist
  #   @room2.add_song(@song1)
  #   @room2.add_song(@song2)
  #   assert_equal("Ya Dancer!", @room2.check_song(@guest2))
  # end

end
