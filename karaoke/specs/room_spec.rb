require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../guest')
require_relative ('../room')
require_relative ('../song')

class TestKaraoke < Minitest::Test

  def setup
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
  end

  def test_guest_has_name
    assert_equal("Ron Burgundy", @guest1.name)
  end

  def test_room_has_max_size
    assert_equal(10, @room1.max_size)
  end

  def test_number_in_room
    assert_equal(0, @room1.people.count)
  end

  def test_ron_in_the_room
    @room1.check_in_guest("Ron Burgundy", @guests)
    persons = @room1.people
    name = persons[0].name
    monie = persons[0].monie
    assert_equal("Ron Burgundy", name)
    assert_equal(10, monie)
  end

  def test_tmm_in_the_room
    @room1.check_in_guest("Ron Burgundy", @guests)
    @room1.check_in_guest("The Muffin Man", @guests)
    @room1.check_out_guest("Ron Burgundy")
    assert_equal([@guest4], @room1.people)
  end

  def test_lets_sing_elton_john
    @room1.add_song("Your Song", @songcollection)
    songs = @room1.songs
    name = songs[0].artist
    assert_equal("Elton John", name)
  end

  def test_room_is_full
    num = 0
    while num < 11  do
      @room1.check_in_guest("Ron Burgundy", @guests)
      num +=1
    end
    result = @room1.check_in_guest("Ron Burgundy", @guests)

    assert_equal("Room is Full", result)
  end

  # def test_fav_song_woo
  #   @room1.add_song("Your Song", @songcollection)
  #   @room1.check_in_guest("Ron Burgundy", @guests)
  #   name = songs[0].artist
  #   assert_equal("Elton John", name)
  # end

end
