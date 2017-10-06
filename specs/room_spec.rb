require_relative( '../room.rb' )
require_relative( '../guests.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Singing Room")
    @guests = Guests.new("Zoe")
    # @songs = Songs.new()
  end

  def test_room_has_name
    assert_equal("Singing Room", @room.name())
  end

  def test_guest_count
    assert_equal(0, @room.guest_count)
  end

  def test_check_in_guest
    @room.guest_check_in(@guest)
    assert_equal(1, @room.guest_count)
  end

end
