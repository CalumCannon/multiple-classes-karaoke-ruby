require('minitest/autorun')
require('minitest/rg')
require_relative("../guest.rb")
require_relative("../venue.rb")
require_relative("../room.rb")

class TestGuest < MiniTest::Test

  def setup
    @test_guest = Guest.new("Calum", 100, "desert rock")
    @test_venue = Venue.new("Karaoke Bar")
    @test_room = Room.new("Dance", 10)

    @test_venue.rooms.push(@test_room)

  end

  def test_guest_name
    assert_equal("Calum", @test_guest.name)
  end

  def test_request_room
    @test_guest.request_room(@test_venue)
    assert_equal(90, @test_guest.money)
  end

end
