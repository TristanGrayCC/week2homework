class Room

  attr_reader :name, :people, :max_size, :songs

  def initialize(name, people, max_size, songs, cost)
    @name = name
    @people = people || []
    @max_size = max_size
    @songs = songs
    @cost = cost
  end

  def check_in_guest(name, guests, club)
    if people.count < max_size
      guest = guests.find{|person|person.name == name}
      if guest != nil && guest.monie >= @cost
        guest.pay_money(@cost)
        club.collect_cash(@cost)
        people << guest
        return "#{guest.name} has been checked in"
      elsif guest != nil && guest.monie < @cost
        return "#{guest.name} doesn't have the cash"
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
      @result = @songs.include?(guest.fav_song)
    end
    return "#{guest.name} yells WOOOO" if @result == true
  end

  def add_song(name, collection)
    choice = collection.find{|song|song.name == name}
    if choice != nil
      songs << choice
    end
  end

end
