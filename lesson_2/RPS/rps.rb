# Rock Paper Scissors Game

# Constant variable with all possible game choices
GAME_CHOICES = ['rock', 'paper', 'scissors']

# Method definitions
def display_winner(user, computer)
  if    (user == 'rock' && computer == 'paper') ||
        (user == 'paper' && computer == "scissors") ||
        (user == 'scissors' && computer == "rock")
    prompt("The computer won.")
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
