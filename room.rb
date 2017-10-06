

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
    return result
  end

  def guest_check_out(guest_name)
    result = find_guest(guest_name)
      if result.name == guest_name
        # @guests.pop()
        @guests.delete(result)
     end
  end

  def show_songs
    return @songs
  end

  def add_song_and_artist(song_name, artist)
    folder = []
    folder << song_name
    folder << artist
    @songs << folder
  end





end
