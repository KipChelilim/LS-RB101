# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation
# output the result

# Start of code
puts ">> Welcome to Calculator!"

puts ">> What's the first number?"
number1 = gets.chomp

puts ">> What's the second number?"
number2 = gets.chomp

puts ">> What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == "1"
  result = number1.to_i + number2.to_i
elsif operator == "2"
  result = number1.to_i - number2.to_i
elsif operator == "3"
  result = number1.to_i * number2.to_i
else operator == "3"
  result = number1.to_f / number2.to_f
end

puts "The result is #{result}"