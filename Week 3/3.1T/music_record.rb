require './input_functions'

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

Genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
  attr_accessor :title, :artist, :genre
  def initialize(t, a, g)
  @title = t
  @artist = a 
  @genre = g 
  end
end

def read_album()

  puts "Enter Album"
  album_title = read_string("Enter album name:")
  album_artist =read_string("Enter artist name:")
  album_genre = read_integer_in_range("Enter Genre between 1 - 4: ", 1, 4)
  album = Album.new(album_title, album_artist, album_genre)
  return album
end

def print_album(album)
    puts('Album information is: ')
    puts(album.title)
    puts(album.artist)
    puts('Genre is ' + album.genre.to_s)
    puts Genre_names[album.genre] 
end

def main()
	album = read_album()
	print_album(album)
end

main()