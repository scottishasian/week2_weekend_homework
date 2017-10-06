

class Room

attr_reader :name, :guests, :songs

  def initialize(name)
    @name = name
    @guests = []
    @songs = []
  end

  def guest_count
    return @guests.count()
  end

  def guest_check_in(guest_name)
    @guests << guest_name
  end

  def find_guest(guest_name)
    result = @guests.find{|guest| guest.name == guest_name}
    return result.name
  end



end
