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

end
