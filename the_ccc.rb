require_relative("song.rb")
require_relative("guest.rb")
require_relative("room.rb")
require_relative("bar_tab.rb")

bartab = BarTab.new
room1 = Room.new("80's Classics", 10, bartab)
room2 = Room.new("Naff 90's", 5, bartab)

print %x{clear}
puts "Hello and welcome to the CodeClan Caraoke Bar"

def menu
  puts "1. Add a new guest"
  puts "2. Check in to Karaoke Room"
  puts "3. Add song to Karaoke Room"
  puts "4. buy a drink"
  puts "Q. Quit"
  puts ": "
  gets.chomp
end

response = menu

while response.upcase != "Q"
  case response
  when "1"
    puts "Please enter your name: "
    name = gets.chomp
    puts "Please enter your budget for today: "
    wallet = gets.chomp.to_i
    puts "Please enter your favourite song (title): "
    favourite_song = gets.chomp

    guest1 = Guest.new(name, wallet, favourite_song)
    print %x{clear}
    puts guest1.display_details
    puts ""
  when "2"
    # print %x{clear}
    puts "OK, we have two rooms set up already or you can choose to set up a new room."
    puts "Our exisiting rooms have been pre-set with a selection of songs."
    puts ""
    puts "You can choose either \"80's Classics\" or \"90's Indie\" or \"build new\""
    puts ""
    puts "please enter what room you wish to use: "
    room_choice = gets.chomp
      if room_choice.downcase == "90's indie"
        room2.checkin_guest(guest1)
      elsif room_choice.downcase == "80's classics"
        room1.checkin_guest(guest1)
      elsif room_choice == "build new"
        puts "coming soon..."
      else
        puts "That is not a valid choice."
        return
      end
    print %x{clear}
    puts "You are checked in and we have deducted the £10 room charge."
    puts guest1.display_details
    puts ""
  when "3"
    puts: "Please enter the song title: "
    title = gets.chomp
    puts "Please enter the artist: "
    artist = gets.chomp
    song = Song.new(title, artist)
    
  end
  response = menu
end

# puts""
#
#   puts "do you have any guests joining you today? (Y/N)"
#   answer = gets.chomp.upcase
#
# until answer == "N"
#   if answer == "Y"
#     puts ""
#     puts "OK, please let me know who is with you today."
#     puts "Please enter your guests name : "
#     guest_name = gets.chomp
#     puts "please enter your guests budget for today: "
#     guest_wallet = gets.chomp.to_i
#     puts "please enter your guests favourite song title: "
#     guest_song = gets.chomp
#     guest = Guest.new(guest_name, guest_wallet, guest_song)
#     puts ""
#     puts "do you have another guest? (Y/N)"
#     answer = gets.chomp.upcase
#   else answer == "N"
#     put ""
#     break
#   end
# end
#
#
#
#
#
#
#
#
# require_relative 'airport'
# require_relative 'flight'
# require_relative 'passenger'
#
# heathrow = Airport.new("Heathrow")
#
# def list_flights(airport)
#   airport.flights.each_with_index do |flight, index|
#     puts "#{index}: #{flight}"
#   end
# end
#
# def menu
#   puts `clear`
#   puts "*** Welcome to the Airport ***"
#   puts '1: Add a flight'
#   puts '2: List flights'
#   puts '3: Add passenger to flight'
#   puts '4: List passengers of flight'
#   puts 'Q: Quit\n\n'
#
#   print '--> '
#   gets.chomp
# end
#
# response = menu
#
# while response.upcase != 'Q'
#   case response
#   when '1'
#     puts "How many passengers are on this flight?"
#     number_of_passengers = gets.to_i
#     puts "What is the flight's destination?"
#     destination = gets.chomp
#     puts heathrow.add_flight(number_of_passengers, destination)
#     gets
#   when '2'
#     list_flights(heathrow)
#     gets
#   when '3'
#     puts "What is the passengers name?"
#     name = gets.chomp
#     p = Passenger.new(name)
#
#     puts "What flight do you want to add a passenger to?"
#     list_flights(heathrow)
#     flight_number = gets.chomp.to_i
#
#     flight = heathrow.flights[flight_number]
#     flight.add_passenger(p)
#
#     puts flight.passengers.to_s
#
#     gets
#   end
#   response = menu
# end
