
class Track
    attr_accessor :name, :location
    def initialize(name, location)
    @name = name
    @location = location
    end
end

def read_track(a_file)
    n = a_file.gets.chomp()
    l = a_file.gets.chomp()
    track = Track.new(n, l)
    return track
end
def print_track(track)
    puts("Track name: #{track.name}")
    puts("Track location: #{track.location}")
end




def main()
    file = File.new("track.txt", "r")
    track = read_track(file)
    file.close
    print_track(track)

end

main() if __FILE__ == $0 