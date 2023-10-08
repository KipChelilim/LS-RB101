# Load config file
require 'yaml'
MESSAGES = YAML.load_file('loan_calc_msg_config.yml')

# Method definitions
def prompt(message)
  puts "=> #{message}"
end

def payment(principal, periods, rate)
  principal = principal.delete(",").to_f
  payment = principal * (rate / (1 - ((1 + rate)**(-periods))))
  payment.round(2)
end

def valid_num?(num)
  num.strip.each_char do |character|
    return false unless ACCEPTABLE_INT_CHARACTERS.include?(character) ||
                        character.to_i.to_s == character
    return false if num.to_i <= 0
  end
end

def valid_rate?(percent)
  percent.strip.each_char do |character|
    return false unless ACCEPTABLE_RATE_CHARACTERS.include?(character) ||
                        character.to_i.to_s == character
    return false if percent.to_i <= 0
  end
end

# Constant variables
ACCEPTABLE_INT_CHARACTERS = %w(, . $)
ACCEPTABLE_RATE_CHARACTERS = %w(, . %)
MONTHS_IN_YEAR = 12

# Start of program
prompt(MESSAGES["msg_welcome"])

loop do
  principal = nil
  loop do
    prompt(MESSAGES["msg_enter_principal"])
    principal = gets.chomp
    break if valid_num?(principal)
    prompt(MESSAGES["msg_invalid_num"])
  end

  duration = nil
  loop do
    prompt(MESSAGES["msg_enter_duration"])
    duration = gets.chomp
    break if valid_num?(duration)
    prompt(MESSAGES["msg_invalid_num"])
  end

  apr = nil
  loop do
    prompt(MESSAGES["msg_enter_apr"])
    apr = gets.chomp
    break if valid_rate?(apr)
    prompt(MESSAGES["msg_invalid_num"])
  end

  months = duration.to_i * MONTHS_IN_YEAR
  monthly_rate = (apr.to_f() * 0.01) / MONTHS_IN_YEAR
  monthly_payment = payment(principal, months, monthly_rate)

  prompt("Principal: $#{principal}\n" +
         "   APR: #{apr}\n" +
         "   Duration: #{duration} years\n" +
         "   Calculating payment...\n")
  prompt(MESSAGES["msg_results"] + "$#{monthly_payment}.\n\n")

  prompt(MESSAGES["msg_continue"])
  answer = gets.chomp.downcase()
  break unless answer.start_with?('y')
end

prompt(MESSAGES["msg_goodbye"])
