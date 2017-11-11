class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def make_payment(num)
    @wallet -= num
  end

  def cheer(song)
    if song == @favourite_song
      return "Ya Dancer!"
    end
  end

end
