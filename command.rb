require_relative( 'room.rb')

class Command

attr_reader :rooms

  def initialize()
    @rooms = []
  end

  def show_rooms
    @rooms
  end

  def add_rooms(room_details)
    @rooms << room_details
    return show_rooms
  end


end
