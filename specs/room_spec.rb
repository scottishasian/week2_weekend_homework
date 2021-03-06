require_relative( '../room.rb' )
require( 'pry' )
require_relative( '../guests.rb' )
require_relative( '../songs.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Singing Room", 400, 2)
    @room2 = Room.new("Pricey Room", 1000, 4)
    @guest = Guests.new("Zoe", 1000)
    @guest2 = Guests.new("Max", 800)
    @guest3 = Guests.new("Naomi", 500)
    @guest4 = Guests.new("Emma", 200)
    @guest5 = Guests.new("Steve", 300)
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
    @room.add_song_and_artist(@songs.song_name, @songs.artist)
    result = @room.show_songs
    assert_equal(@room.playlist, result)
  end

  def test_add_song_and_artist
    @room.add_song_and_artist(@songs.song_name, @songs.artist)
    result = @room.songs
    array = [@songs.song_name, @songs.artist]
    assert_equal(array, result)
  end

  #Not too happy with this test.

  # def test_find_song_by_song_name
  #   @room.add_song_and_artist(@songs.song_name, @songs.artist)
  #   result = @room.find_song_by_song_name(@songs.song_name)
  #   assert_equal("Song 2", result)
  #
  # end
  # Come back to later.

  # def test_find_song_by_artist
  # end

  def test_room_capacity_empty
    assert_equal("Empty", @room.room_capacity)
  end

  def test_room_capacity_one_person
    @room.guest_check_in(@guest)
    assert_equal("The room has 1 person.", @room.room_capacity)
  end

  def test_room_capacity_two_people
    @room.guest_check_in(@guest)
    @room.guest_check_in(@guest2)
    assert_equal("The room has 2 people.", @room.room_capacity)
  end

  def test_room_full
    @room2.guest_check_in(@guest)
    @room2.guest_check_in(@guest2)
    @room2.guest_check_in(@guest3)
    @room2.guest_check_in(@guest4)
    result = @room2.guest_check_in(@guest5)
    assert_equal("The room is full", result)
  end

  def test_room_full_large_room
    @room.guest_check_in(@guest)
    @room.guest_check_in(@guest2)
    result = @room.guest_check_in(@guest3)
    assert_equal("The room is full", result)
  end

  def test_room_fee
    assert_equal(400, @room.fee)
  end

  def test_guest_charged
    @room.guest_check_in(@guest)
    result = @room.find_guest(@guest.name)
    updated = @room.guest_charged(result, @room.fee)
    assert_equal(600, updated)
  end

  def test_guest_charged_next_room
    @room2.guest_check_in(@guest)
    result = @room2.find_guest(@guest.name)
    updated = @room2.guest_charged(result, @room2.fee)
    assert_equal(0, updated)
  end

  def test_guest_charged_not_enough_money
    @room2.guest_check_in(@guest4)
    result = @room2.find_guest(@guest4.name)
    updated = @room2.guest_charged(result, @room2.fee)
    assert_equal("Not enough money.", updated)
  end

end
