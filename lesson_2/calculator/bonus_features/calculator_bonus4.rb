# Load config file
require 'yaml'
MESSAGES = YAML.load_file('calc_config.yml')

# Method definitions
def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.strip.each_char do |character|
    return false unless (character == ".") || (character.to_i.to_s == character)
  end
end

OPERATOR_DESCRIPTIONS = { '1': 'Adding',
                          '2': 'Subtracting',
                          '3': 'Multiplying',
                          '4': 'Dividing' }

# Start of program
prompt(MESSAGES["msg_welcome"])
name = nil
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES["msg_valid_name"])
  else
    break
  end
end
prompt("Hi #{name}!")

# Main calculation loop
loop do
  number1 = nil
  loop do
    prompt(MESSAGES["msg_first_num"])
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES["msg_valid_num"])
    end
  end

  number2 = nil
  loop do
    prompt(MESSAGES["msg_second_num"])
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES["msg_valid_num"])
    end
  end

  prompt(MESSAGES["operator_prompt"])
  operator = nil
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["msg_invalid_operator"])
    end
  end

  prompt("#{OPERATOR_DESCRIPTIONS[operator.to_sym]} the two numbers...")

  result = case operator
           when "1"
             number1.to_i + number2.to_i
           when "2"
             number1.to_i - number2.to_i
           when "3"
             number1.to_i * number2.to_i
           when "4"
             number1.to_f / number2.to_f
           end
  prompt("The result is #{result}")

  prompt(MESSAGES["msg_continue"])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES["msg_end"])
