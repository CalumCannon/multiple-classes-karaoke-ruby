require('pry')
class Venue

  attr_reader :name, :entry_fee
  attr_accessor :rooms

  def initialize(name)
    @name = name
    @entry_fee = 10
    @rooms = []
  end

  def check_in_guest(guest)
    # FIND ROOM THAT HAS SPACE
    room = get_room_with_space()
    # Put guest in room
    room.guests.push(guest)
    # check guest song pref with room songs
    # if room.songs.contains?(guest.favourite_genre)

    return room
  end

  def check_out_guest(guest, room)
    # find guest in room and remove
    room.guests.delete(guest)
  end

  def get_room_with_space
     return @rooms.find{ |room| room.capacity > room.guests.length }
  end

  def add_song(song,room)
    room.songs.push(song)
  end

end
