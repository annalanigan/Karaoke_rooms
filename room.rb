class Room

attr_reader :name, :guests, :playlist, :capacity

  def initialize(name, capacity)
    @name = name
    @guests = []
    @playlist = []
    @capacity = capacity
  end

  def checkin_guest(guest_obj)
    @guests << guest_obj if @guests.length < @capacity
  end

  def checkout_guest(guest_obj)
    @guests.delete(guest_obj)
  end

  def add_song(song_obj)
    @playlist << song_obj
  end

end
