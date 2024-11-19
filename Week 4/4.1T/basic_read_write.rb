def write_data_to_file(file_name)
    a_file = File.new(file_name, "w")
    
      if a_file
       a_file.puts('5')
       a_file.puts('Fred')
       a_file.puts('Sam')
       a_file.puts('Jill')
       a_file.puts('Jenny')
       a_file.puts('Zorro')
       a_file.close()
       else puts "Unable to open file to write."
       end
    end
    
    def read_data_from_file(file_name)
        a_file = File.new(file_name, "r")
        if a_file
          count = a_file.gets.to_i()
          index = 0
            while (index < count)
            puts a_file.gets()
            index += 1
            end
          a_file.close()
        else puts "Unable to open file to read!"
        end
    end
    
    def main
      a_file = File.new("mydata.txt", "w") 
      write_data_to_file(a_file)
      a_file.close()
      
      a_file = File.new("mydata.txt", "r") 
      read_data_from_file(a_file)
      a_file.close()
    end
    
    main
    