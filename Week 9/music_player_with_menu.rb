require './input_functions'

# It is suggested that you put together code from your 
# previous tasks to start this. eg:
# 8.1T Read Album with Tracks

#-----------------------------------------------------------------------------------------------

module Genre
    POP, CLASSIC, JAZZ, ROCK = *1..4
end
$genre_name = ["Null", "Pop", "Classic", "Jazz", "Rock"]

#-----------------------------------------------------------------------------------------------

class Album
    attr_accessor :artist, :title, :label, :genre, :tracks
    def initialize (artist, title, label, genre, tracks)
        @artist = artist
        @title = title
        @label = label
        @genre = genre
        @tracks = tracks
    end
end

#-----------------------------------------------------------------------------------------------

class Track
    attr_accessor :name, :location
    def initialize (name, location)
        @name = name
        @location = location
    end
end

#-----------------------------------------------------------------------------------------------

def read_track(music_file)
    name = music_file.gets.chomp()
    location = music_file.gets.chomp()
    track = Track.new(name, location)
    return track
end

#-----------------------------------------------------------------------------------------------

def read_tracks(music_file)
    tracks = Array.new()
    count = music_file.gets.to_i()
    index = 0
    while index < count
        tracks << read_track(music_file)
        index += 1
    end
    return tracks
end

#-----------------------------------------------------------------------------------------------

def read_album(music_file)
    artist = music_file.gets.chomp()
    title = music_file.gets.chomp()
    label = music_file.gets.chomp()
    genre = music_file.gets.chomp.to_i()
    tracks = read_tracks(music_file)
    album = Album.new(artist, title, label, genre, tracks)
    return album
end

#-----------------------------------------------------------------------------------------------

def read_in_albums()
    file_addr = read_string("Please enter file address: ")
    # Check if filename is available using method - File.exists?
    # Exclamation mark in front of method is meant to reverse the method
    while !File.exists?(file_addr)
        puts "File address not found."
        file_addr = read_string("Please re-enter file address: ")
    end

    puts "File address is found and read. Returning to HOME PAGE."

    mult_albums = Array.new()

    music_file = File.new(file_addr, 'r')
    index = 0
    count = music_file.gets.to_i()
    while index < count
        mult_albums << read_album(music_file)
        index += 1
    end
    return mult_albums
    music_file.close
end

#-----------------------------------------------------------------------------------------------

def display_albums(mult_albums)
    #Assure user did Menu option 1
    if mult_albums.length == 0
        puts "Albums not found. Please read in file address."
        return
    end
    
    begin
        puts " "
        puts "DISPLAY ALBUMS"
        puts "1. Display all Albums"
        puts "2. Display Album follow by Genre"
        puts "3. Exit to HOME PAGE"
        choice = read_integer_in_range("Please enter your choice: ",1,3)
    case choice
        when 1
            display_all_albums(mult_albums)
        when 2
            display_album_genre(mult_albums)
        when 3
            finished = true
        else
            puts "Please enter choices as displayed"
        end
    end until finished
end

#-----------------------------------------------------------------------------------------------

def display_all_albums(mult_albums)
    puts " "
    puts "LEGENDS: ALBUM No | ARTIST | TITLE | RECORD LABEL | GENRE"
    puts " "

    index = 1
    while index < mult_albums.length
        album = mult_albums[index]
        puts puts " " * 3 + index.to_s() + " " * 3 + "|" + " " + album.artist + " " + "|" + " " + album.title + " " + "|" + " " + album.label + " " + "|" + " " + $genre_name[album.genre]
        puts " "
        index += 1
    end
end 

#-----------------------------------------------------------------------------------------------

def display_album_genre(mult_albums)
    puts " "
    
    index = 1
    while index < $genre_name.length
        puts index.to_s() + ". " + $genre_name[index].to_s()
        index += 1
    end
    puts " "
    display_genre = read_integer_in_range("Please enter your choice: ",1,4)

    puts " "
    puts "LEGENDS: ARTIST | TITLE | RECORD LABEL | GENRE"
    puts " "

    index = 0
    while index < mult_albums.length
    album = mult_albums[index]
        if album.genre == display_genre
            puts " " * 9 + album.artist + " " + "|" + " " + album.title + " " + "|" + " " + album.label + " " + "|" + " " + $genre_name[album.genre]
            puts " "
        end
    index += 1
    end
end

#-----------------------------------------------------------------------------------------------

def select_play_album(mult_albums)
    if mult_albums.length == 0
        puts "Albums not found. Please read in file address."
        return
    end

    display_all_albums(mult_albums)
    album_no = read_integer_in_range("Please enter ALBUM No: ",1,4)
    album_select = mult_albums[album_no]


    puts "LEGENDS: ALBUM No | ARTIST | TITLE | RECORD LABEL | GENRE"
    puts " "
    puts " " * 9.5 + album_select.artist + " " + "|" + " " + album_select.title + " " + "|" + " " + album_select.label +  " " + "|" + " " + $genre_name[album_select.genre]
    puts " "

    if album_select.tracks.length == 0
        puts "No track found in this album"
        return
    end
    puts "Tracks in this Album:"
    puts " "
    index = 1
    while index < album_select.tracks.length
        puts index.to_s() + ". " + album_select.tracks[index].name.to_s()
        puts " "
        index += 1
    end
    
    track_no = read_integer_in_range("Please enter track number: ",0,album_select.tracks.length)
    track_select = album_select.tracks[track_no]
    puts " "
    puts " Playing track: " + track_select.name.to_s() + " from album " + album_select.title.to_s()
    sleep(4)
end

#-----------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------
def main()
    finished = false
    mult_albums = Array.new()
    begin
        puts " "
        puts "HOME PAGE"
        puts "1. Read in Albums"
        puts "2. Display Albums"
        puts "3. Select an Album to play"
        puts "5. Exit the application"
        choice = read_integer_in_range("Please enter your choice: ",1,5)
    case choice
        when 1
            mult_albums = read_in_albums()
        when 2
            display_albums(mult_albums)
        when 3
            select_play_album(mult_albums)
        when 5
            puts "Thank you for using the application!"
            finished = true
        else
            puts "Please enter choices as displayed"
        end
    end until finished
end
main()
            


         
