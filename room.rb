class Room
  FEE = 10

attr_reader :name, :guests, :playlist, :capacity, :tab

  def initialize(name, capacity)
    @name = name
    @guests = []
    @playlist = []
    @capacity = capacity
    @tab = 0
  end

  def checkin_guest(guest_obj)
    if check_capacity && guest_obj.wallet >= FEE
      guest_obj.make_payment(FEE)
      @tab += FEE
      @guests << guest_obj
    end
  end

  def check_capacity
    @guests.length < @capacity
  end

  def checkout_guest(guest_obj)
    @guests.delete(guest_obj)
  end

  def add_song(song_obj)
    @playlist << song_obj
  end

  # def check_song(guest)
  #   @playlist.each { |song| guest.cheer(song) }
  # end

end
