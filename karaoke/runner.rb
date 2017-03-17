require ('pry')
require_relative ('guest')
require_relative ('room')
require_relative ('song')

@room1 = Room.new("Room 1",[],10,[])
@guest1 = Guest.new("Ron Burgundy",15, @song2)
@guest2 = Guest.new("Jeremy Renner",20, @song1)
@guest3 = Guest.new("Charlotte Church",25, @song3)
@guest4 = Guest.new("The Muffin Man",450, @song6)
@guests = [@guest1,@guest2,@guest3,@guest4]
@song1 = Song.new("Space Oddity", "David Bowie")
@song2 = Song.new("Your Song", "Elton John")
@song3 = Song.new("Single Ladies", "Beyonce")
@song4 = Song.new("The Scientist", "Coldplay")
@song5 = Song.new("Bridge Over Troubled Water", "Simon and Garfunkle")
@song6 = Song.new("Let It Be", "The Beatles")
@songcollection = [@song1,@song2,@song3,@song4,@song5,@song6]
guest_another = "Prep"
song_another = "Prep"

##########################################
guest_list = @guests.map{|person|person.name}
puts "Guests in the guest list are #{guest_list}"
song_list = @songcollection.map{|choice|choice.name}
puts "Guests in the guest list are #{song_list}"

puts 'Who are you checking in?'
guest = gets.chomp
@room1.check_in_guest(guest, @guests)
until guest_another == "no one"
  puts 'Anyone else? Reply no one if you are done'
  unless song_another == "no one"
    guest_another = gets.chomp
  end
  @room1.check_in_guest(guest_another, @guests)
end

puts "What is your first song choice?"
song = gets.chomp
@room1.add_song(song, @songcollection)
until song_another == "done"
  puts 'Anyone else? Reply done if you are done'
  unless song_another == "done"
    song_another = gets.chomp
  end
  @room1.add_song(song_another, @songcollection)
end

guests = @room1.people.map{|person|person.name}
puts "#{guests} are in #{@room1.name}"
# puts @room1.songs
binding.pry
song = @room1.songs.map{|choice|choice.name}
puts "#{song} is in the #{@room1.name} list"
puts @room1.fav_song_here
