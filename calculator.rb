# / * - + ** 
while true

	puts "Please enter the first number:"
	number1 = gets.chomp.to_f

	puts "Please enter the second number:"
	number2 = gets.chomp.to_f

	puts "Please enter an operation to perform: + - * /"
	operation = gets.chomp

	case operation
		when "+" 
			total = number1 + number2
		when "-" 
			total = number1 - number2
		when "*" 
			total = number1 * number2
		when "/"
			if number2 != 0 
				total = number1 / number2
			else 
				total = "undefined: cannot divide by zero"
			end
		else 
			total = nil
	end

	if total == nil
		puts "Invalid operation selected."
	else
		puts "The total is #{total}."
	end

	puts "Would you like to perform another calculation? (Y for Yes)"

	break unless gets.chomp == "Y"

end