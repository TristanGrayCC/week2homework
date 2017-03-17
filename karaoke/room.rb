class Room

  attr_reader :name, :people, :max_size, :songs

  def initialize(name, people, max_size, songs)
    @name = name
    @people = people
    @max_size = max_size
    @songs = songs
  end

  def check_in_guest(name, guests)
    if people.count < max_size
      guest = guests.find{|person|person.name == name}
      if guest != nil
        guest.pay_money(5)
        people << guest
      end
    else
      return "Room is Full"
    end

  end

  def check_out_guest(name)
    person = people.find{|guest|guest.name == name}
    people.delete(person)
  end

  def fav_song_here
    for guest in people
      result = @songs.include?(guest.fav_song)
        if result == true
          return "WOOOO"
        end
    end
  end

  def add_song(name, collection)
    choice = collection.find{|song|song.name == name}
    if choice != nil
      songs << choice
    end
  end

end
