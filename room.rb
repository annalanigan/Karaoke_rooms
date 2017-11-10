class Room

attr_reader :name, :guests, :playlist

  def initialize(name, guests = [], playlist = [])
    @name = name
    @guests = guests
    @playlist = playlist
  end

  def checkin_guest(guest_obj)
    @guests << guest_obj
  end

  def checkout_guest(guest_obj)
    @guests.delete(guest_obj)
  end

end
