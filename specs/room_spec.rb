require_relative( '../room.rb' )
require( 'pry' )
require_relative( '../guests.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Singing Room")
    @guest = Guests.new("Zoe")
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
    guest_found = @room.find_guest(@guest.name)
    assert_equal(@guest.name, guest_found)
  end

  def test_find_guest_by_name
    @room.guest_check_in(@guest)
    assert_equal("Zoe", @room.find_guest(@guest.name))
  end

end
