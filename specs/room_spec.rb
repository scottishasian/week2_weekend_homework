require_relative( '../room.rb' )
require( 'pry' )
require_relative( '../guests.rb' )
require_relative( '../songs.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Singing Room")
    @guest = Guests.new("Zoe")
    @songs = Songs.new("Song 2", "Blur")
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
    assert_equal(@guest, guest_found)
  end

  def test_find_guest_by_name
    @room.guest_check_in(@guest)
    assert_equal(@guest, @room.find_guest(@guest.name))
  end

  def test_check_out_guest
    @room.guest_check_in(@guest)
    @room.guest_check_out(@guest.name)
    assert_equal(0, @room.guest_count)
  end

  def test_show_songs
    result = @room.show_songs
    assert_equal(@room.songs, result)
  end

  def test_add_song_and_artist
    @room.add_song_and_artist(@songs.song_name, @songs.artist)
    result = @room.songs[0]
    array = [@songs.song_name, @songs.artist]
    assert_equal(array, result)
  end

  #Not too happy with this test.

  def test_find_song_by_song_name
  end

  def test_find_song_by_artist
  end

end
