require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Life on Mars", "Zhavid Bowie")
  end

  def test_song_has_title
    assert_equal("Life on Mars", @song.title)
  end

  def test_song_has_artist
    assert_equal("Zhavid Bowie", @song.artist)
  end

end
