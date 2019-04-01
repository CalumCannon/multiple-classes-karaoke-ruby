require('minitest/autorun')
require('minitest/rg')
require_relative("../venue.rb")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")


class TestVenue < MiniTest::Test

  def setup
    @test_venue = Venue.new("Karaoke Bar")
    @test_guest = Guest.new("Calum", 100, "desert rock")
    @test_room = Room.new("Dance", 10)
    @test_song = Song.new("Burn the witch", "Queens of the stone age")
    @test_venue.rooms.push(@test_room)
  end

  def test_guest_name
    assert_equal("Karaoke Bar", @test_venue.name)
  end

  def test_check_in_guest
    @test_venue.check_in_guest(@test_guest)
    assert_equal(1,@test_room.guests.count)
  end

  def test_check_out_guest
      @test_venue.check_in_guest(@test_guest)
      @test_venue.check_out_guest(@test_guest, @test_room)
      assert_equal(0,@test_room.guests.length)
  end

  def test_get_room_with_space_return_room
    result = @test_venue.get_room_with_space
    assert_equal("Dance", result.name)
  end

  def test_get_room_with_space_return_nil

    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)
    @test_venue.check_in_guest(@test_guest)

    result = @test_venue.get_room_with_space

    assert_nil(result)
  end

  def test_add_song_to_room
    @test_venue.add_song(@test_song, @test_room)
    assert_equal(1,@test_room.songs.length)
  end


end
