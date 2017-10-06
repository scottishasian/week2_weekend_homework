require_relative( '../songs.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestSongs < MiniTest::Test

  def setup
    @song = Songs.new("Song 2", "Blur")
  end

  def test_song_has_a_name
    assert_equal("Song 2", @song.song_name())
  end

  def test_song_has_an_artist
    assert_equal("Blur", @song.artist())
  end

end
