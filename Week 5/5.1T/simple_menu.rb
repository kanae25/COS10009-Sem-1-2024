require './input_functions'

def display_albums

    begin
    puts 'Display Albums Menu:'
    puts '1 Display All Albums'
    puts '2 Display Albums by Genre'
    puts '3 Return to Main Menu'
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    case choice
    when 1
      all_albums
    when 2 
      genre_albums
    when 3
      finished = true
    else
      puts "Please select again"
    end
  
end until finished
end



def all_albums
  read_string("You selected Display All Albums. Press enter to continue")
end

def genre_albums
  read_string("You selected Display Albums By Genre. Press enter to continue")
end

def load_albums
  read_string("You selected Load Albums. Press enter to continue")
end

def main()
  finished = false
  begin
    puts 'Main Menu:'
    puts '1 Load Albums'
    puts '2 Display Albums'
    puts '3 Exit'
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    case choice
    when 1
      load_albums
    when 2
      display_albums
    when 3
      finished = true
    else
      puts "Please select again"
    end
  end until finished
end

main()