require("pry")
class Room

  attr_reader :name, :capacity
  attr_accessor :guests, :songs

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @guests = []
    @songs = []
  end

  def add_guest(guest)
    if guests.length >= capacity
      p "ROOM IS FULL"
      return false
    end

    @guests.push(guest)

  end

  def has_song(song_name)
    song = @songs.find{|song| song.title == song_name }
    # binding.pry
    if(song == nil)
      return false
    end
    return true
  end

end
