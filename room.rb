class Room
  FEE = 10

attr_reader :name, :guests, :playlist, :capacity

  def initialize(name, capacity)
    @name = name
    @guests = []
    @playlist = []
    @capacity = capacity
  end

  def checkin_guest(guest_obj)
    if @guests.length < @capacity && guest_obj.wallet >= FEE
      guest_obj.make_payment(FEE)
      @guests << guest_obj
    end
  end

  def checkout_guest(guest_obj)
    @guests.delete(guest_obj)
  end

  def add_song(song_obj)
    @playlist << song_obj
  end

end
