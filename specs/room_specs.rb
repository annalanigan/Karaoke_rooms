require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Anna")
    @guest2 = Guest.new("Gaelle")
    guests = [@guest1, @guest2]
    @song1 = Song.new("Life on Mars", "Zhavid Bowie")
    @song2 = Song.new("Rooting For You", "London Grammar")
    playlist = [@song1, @song2]
    @room1 = Room.new("Rock Room", guests, playlist)
    @room2 = Room.new("Lala Land")
  end

  def test_room_has_name
    assert_equal("Rock Room", @room1.name)
  end

  def test_room_has_guests__two
    assert_equal(2, @room1.guests.length)
  end

  def test_room_has_guests__empty
    assert_equal(0, @room2.guests.length)
  end

  def test_room_has_songs__two
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
    @room1.checkout_guest(@guest2)
    assert_equal(1, @room1.guests.length)
  end

  def test_add_song
    @room2.add_song(@song2)
    assert_equal(1, @room2.playlist.length)
  end

end
