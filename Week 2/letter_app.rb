require './input_functions'

def read_name()
    title = read_string ("Please enter your title: (Mr, Mrs, Ms, Miss, Dr)")
    first_name = read_string 'Please enter your first name:'
    last_name = read_string 'Please enter your last name:'
    full_name = title + ' ' + first_name + ' ' + last_name
    return full_name
end

def read_address()
    house_number = read_string 'Please enter the house or unit number:'
    street_name = read_string 'Please enter the street name:'
    suburb_name = read_string 'Please enter the suburb:'
    postcode_number = read_integer_in_range 'Please enter a postcode (0000 - 9999)', 0, 9999
    full_address = house_number + ' ' + street_name + "\n" + suburb_name + ' ' + postcode_number.to_s()
    return full_address
end


def read_label()
    receiver_name = read_name()
    receiver_address = read_address()
    return(receiver_name + "\n" + receiver_address)
end

def read_message()
    subject = read_string ('Please enter your message subject line:')
    content = read_string ('Please enter your message content:')
    return ('RE: ' + subject + "\n\n" + content)
end

def send_message_to_address(label, message)
    puts (label)
    puts (message)
end


def main()
    label = read_label()
    message = read_message()
    send_message_to_address(label, message)
end
main()