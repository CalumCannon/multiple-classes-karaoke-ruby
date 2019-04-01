require('pry')
class Guest

 attr_reader :name, :favourite_song, :mood, :money

def initialize(name, money, favourite_song)
  @name = name
  @money = money
  @favourite_song = favourite_song
  @mood = "happy"
end


def request_room(karaoke_bar)
  # take money from guest
  spend_money(karaoke_bar.entry_fee)
  # add guest to room
  room = karaoke_bar.check_in_guest(self)
  # binding.pry
  if(room.has_song(@favourite_song))
    binding.pry
    woo
  end

end

def spend_money(value)
  @money -= value
end

def woo
  p "YAASSSSSS"
end

def buy_drink(bar)
  # should take one off of the drink total
  # should increase drunkenness of guest
  # could increase singing ability
end

end
