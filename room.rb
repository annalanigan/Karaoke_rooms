class Room

attr_reader :name, :guests, :playlist

  def initialize(name, guests = [], playlist = [])
    @name = name
    @guests = guests
    @playlist = playlist
  end
  
end
