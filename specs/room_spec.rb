require('minitest/autorun')
require('minitest/rg')
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @test_room = Room.new("Dance", 10)


    @test_song = Song.new("Burn the witch", "Queens of the stone age")
    @test_room.songs.push(@test_song)
    @test_guest = Guest.new("Calum", 100, @test_song)
  end

  def test_guest_name
    assert_equal("Dance", @test_room.name)
  end

  def test_add_guest
    @test_room.add_guest(@test_guest)
    assert_equal(1, @test_room.guests.length)
  end

  def test_room_full
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)
        @test_room.add_guest(@test_guest)

      assert_equal(false, @test_room.add_guest(@test_guest))
  end

  def test_has_song_true
    assert_equal(true, @test_room.has_song(@test_guest.favourite_song.title))
  end

  def test_has_song_false
    assert_equal(false, @test_room.has_song("Friday"))
  end

end
