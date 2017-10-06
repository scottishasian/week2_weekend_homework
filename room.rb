require_relative( 'songs.rb' )

class Room

attr_reader :name, :guests, :songs, :playlist
  def initialize(name)
    @name = name
    @guests = []
    @songs = []
    @playlist = []
    @playlist << @songs

    #Songs and artist are added into an array, which is pushed into playlist.

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
    return @playlist
  end

  def add_song_and_artist(song_name, artist)
    # folder = []
    # folder << song_name
    # folder << artist
    # @songs << folder
    @songs << song_name
    @songs << artist
  end

  # def find_song_by_song_name(name)
  #   for i in @playlist
  #     for l in i
  #       puts l[0]
  #     end
  #   # end
  #
  # end

  def room_capacity
    if @guests.count == 2
      return "The room has #{@guests.count} people."
    elsif @guests.count == 1
      return "The room has #{@guests.count} person."
    else
      return "Empty"
    end
  end





end
