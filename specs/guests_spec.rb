require_relative( '../guests.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

class TestGuests < MiniTest::Test

  def setup
    @guests = Guests.new("Zoe", 1000)
  end

  def test_guest_has_name
    assert_equal("Zoe", @guests.name())
  end

  def test_guest_has_money
    assert_equal(1000, @guests.money())
  end

end
