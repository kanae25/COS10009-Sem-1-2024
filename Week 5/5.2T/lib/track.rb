class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end


def read_track(a_file)
  name = a_file.gets 
  loc = a_file.gets 
  track = Track.new(name, loc)
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

main if __FILE__ == $0 