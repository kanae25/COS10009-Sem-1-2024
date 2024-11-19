module Genre
    POP, CLASSIC, JAZZ, ROCK = *1..4
  end
  
  $genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']
  
  class Album
      attr_accessor :title, :artist, :genre, :tracks
  
      def initialize (title, artist, genre, tracks)
          @title = title
          @artist = artist
          @genre = genre
          @tracks = tracks
      end
  end
  
  class Track
      attr_accessor :name, :location
  
      def initialize (name, location)
          @name = name
          @location = location
      end
  end
    
  def read_track(music_file)
      name = music_file.gets.chomp()
      location = music_file.gets.chomp()
      track = Track.new(name, location)
      return track
  end
    
  def read_tracks(music_file)
      
      count = music_file.gets().to_i()
        tracks = Array.new()
        index = 0
      while (index < count)
            track = read_track(music_file)
            tracks << track
          index += 1
      end
      return tracks
      
  end
  
  def print_tracks(tracks)
      index = 0
      while index < tracks.length
          puts tracks[index].name
          puts tracks[index].location
          index += 1
      end
  end
    
  def read_album(music_file)
        album_title = music_file.gets.chomp()
        album_artist = music_file.gets.chomp()
        album_genre = music_file.gets.chomp.to_i()
        tracks = read_tracks(music_file)
        album = Album.new(album_title, album_artist, album_genre, tracks)
        return album
  end
  
  
  def print_album(album)
        puts(album.title)
        puts(album.artist)
        puts('Genre is ' + album.genre.to_s)
        puts($genre_names[album.genre])
        print_tracks(album.tracks)  
  end
  
  def print_track(track)
        puts('Track title is: ' + track.title)
      puts('Track file location is: ' + track.file_location)
  end
    
  def main()
      music_file = File.new("album.txt", "r")
      album = read_album(music_file)
      music_file.close()
      print_album(album)
  end
  
  main()