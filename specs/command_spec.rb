require_relative( '../command.rb' )
require_relative( '../room.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestCommand < MiniTest::Test

  def setup
    @command = Command.new()
    @room = Room.new("Singing Room", 400, 2)
    @room2 = Room.new("Pricey Room", 1000, 4)
  end

  def test_show_rooms
    assert_equal([], @command.rooms)
  end

end
