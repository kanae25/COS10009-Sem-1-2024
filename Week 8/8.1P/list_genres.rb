Genre_array = ["Null", "Pop", "Classic", "Jazz", "Rock"]

def main()
    index = 1
    while (index < Genre_array.length)
        puts (index.to_s() + " " + Genre_array[index])
        index +=1
    end

end

main()