class Room
  FEE = 10

attr_reader :name, :guests, :playlist, :capacity, :bar_tab

  def initialize(name, capacity, bar_tab)
    @name = name
    @guests = []
    @playlist = []
    @capacity = capacity
    @bar_tab = bar_tab
  end

  def checkin_guest(guest_obj)
    if check_capacity && guest_obj.wallet >= FEE
      guest_obj.make_payment(FEE)
      @bar_tab.take_fee(FEE)
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
