require 'date'

INCHES = 39.3701

def main()

	printf('What is your name? ')
	name =gets.chomp()
	puts('Your name is ' + name + '!')

	printf('What is your family name? ')
	family_name =gets.chomp()
	puts('Your family name is: ' + family_name + '!')

	printf('What year were you born? ')
	year_born =gets()
	age =Date.today.year - year_born.to_i()
	puts('So you are ' + age.to_s + ' years old')

	printf('Enter your height in metres (i.e as a float): ')
	value =gets.to_f() 
	value = value * INCHES
	printf('Your height in inches is: ')

	puts(value.to_s())
	puts('Finished')
end

main()
