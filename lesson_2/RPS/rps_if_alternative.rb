# Rock Paper Scissors Game

# Constant variable with all possible game choices & the user losing conditions
GAME_CHOICES = %w(rock paper scissors)

# Constant variable with all user losing conditions to replace if conditions
USER_LOSING_CONDITIONS = %w(rockpaper paperscissors scissorsrock)

# Method definitions
# Replace if complexity by checking losing conditions for user's choice
def display_winner(user, computer)
  if USER_LOSING_CONDITIONS.include?(user + computer)
    prompt("Sorry, you lost.")
  elsif user == computer
    prompt("It's a tie!")
  else
    prompt("You won!")
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

# Start of program
loop do
  user_choice = nil
  loop do
    prompt("Choose one: #{GAME_CHOICES.join(', ')}")
    user_choice = gets.chomp
    if GAME_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = GAME_CHOICES.sample

  puts "You choice #{user_choice}; the computer chose #{computer_choice}"
  display_winner(user_choice, computer_choice)

  prompt("Do you want to play again? (Y to replay)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
