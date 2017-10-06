require_relative( 'songs.rb' )

class Room

attr_reader :name, :guests, :songs, :playlist, :fee, :capacity
attr_writer :guests, :fee

  def initialize(name, fee, capacity)
    @name = name
    @guests = []
    @songs = []
    @playlist = []
    @playlist << @songs
    @fee = fee
    @capacity = capacity

    #Songs and artist are added into an array, which is pushed into playlist.

  end

  def guest_count
    return @guests.count()
  end

  def guest_check_in(guest_name)
      @guests << guest_name
      if @guests.count > @capacity
        @guests.pop()
        return "The room is full"
      end
  end

  #Come back to this one, should be a way to loop.

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

  def guest_charged(guest_name, fee)
    return guest_name.money - fee
  end


#Need to add and find new rooms.
# check room prices
# list most expensive and cheapest



end
