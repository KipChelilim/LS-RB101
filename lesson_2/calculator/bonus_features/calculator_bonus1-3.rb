# Method definitions
def prompt(message)
  puts "=> #{message}"
end

# Bonus 1 - Using to_i.to_s to evaluate no data lost through conversion
# Bonus 2 - Test if each character is numeric, skip expected character (".")
#     solution needed: other text formats/charc (e.g. scientific/E notation, %)

def valid_number?(num)
  num.strip.each_char do |character|
    return false unless (character == ".") || (character.to_i.to_s == character)
  end
end

# Bonus 3 - replace with a hash lookup and run other code in separate method
OPERATOR_DESCRIPTIONS = { '1': 'Adding',
                          '2': 'Subtracting',
                          '3': 'Multiplying',
                          '4': 'Dividing' }

# Start of program
prompt("Welcome to Calculator! Enter your name:")

name = nil
loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

# Main loop
loop do
  number1 = nil
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesnt' look like a valid number.")
    end
  end

  number2 = nil
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesnt' look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = nil
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4.")
    end
  end

  prompt("#{OPERATOR_DESCRIPTIONS[operator.to_sym]} the two numbers...")

  result = case operator
           when "1"
             number1.to_f + number2.to_f
           when "2"
             number1.to_f - number2.to_f
           when "3"
             number1.to_f * number2.to_f
           when "4"
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")
