require_relative( '../room.rb' )
require_relative( '../guests.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestRoom < MiniTest::Test

  def setup
    @name = Room.new("Singing Room")
    @guests = Guests.new("Zoe")
    # @songs = Songs.new()
  end

  def test_room_has_name
    assert_equal("Singing Room", @name.name())
  end

end
