require_relative( 'room.rb')

class Command

  attr_reader :rooms

  def initialize()
    @rooms = []
  end

end
