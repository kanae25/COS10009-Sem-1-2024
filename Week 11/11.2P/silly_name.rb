def print_silly_name(name)
    puts name + " is a"
    index = 0
    while (index < 60)
      print "silly "
      index += 1
    end
    puts "name!"
  end
  
  def main
    name = read_string("What is your name?")
    if name == "Ted" or name == "Fred"
      puts name + " is an awesome name!"
    else
      print_silly_name(name)
    end
  end
  
  main
  