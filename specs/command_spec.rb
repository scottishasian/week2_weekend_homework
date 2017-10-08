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

  def test_show_rooms_empty
    assert_equal([], @command.show_rooms)
  end

  def test_add_rooms
    @command.add_rooms(@room)
    assert_equal(@command.rooms, @command.show_rooms)
  end

end
