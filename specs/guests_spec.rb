require_relative( '../guests.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestGuests < MiniTest::Test

  def setup
    @guests = Guests.new("Zoe")
  end

  def test_guest_has_name
    assert_equal("Zoe", @guests.name())
  end

end
