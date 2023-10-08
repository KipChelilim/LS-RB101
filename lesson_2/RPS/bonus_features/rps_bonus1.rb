## Rock Paper Scissors Lizard Spock Game

# Constant variables
GAME_CHOICES = %w(rock paper scissors lizard spock)
WIN_CONDITIONS = { spock: %w(scissors rock),
                   lizard: %w(spock paper),
                   rock: %w(lizard scissors),
                   paper: %w(rock spock),
                   scissors: %w(paper lizard)
                  }

# Method defintions
def display_winner(user, computer)
  if WIN_CONDITIONS[user.to_sym].include?(computer)
    prompt("You won! ")
  elsif user == computer
    prompt("It's a tie!")
  else
    prompt("Sorry, you lost...")
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

# Start of program
prompt("Let's play a round of Rock, Paper, Scissors, Lizard, Spock!")

loop do
  user_choice = nil
  loop do
    prompt("Choose one: #{GAME_CHOICES.join(', ')}")
    user_choice = gets.chomp.downcase
    if GAME_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = GAME_CHOICES.sample

  prompt("You chose #{user_choice.upcase}; the computer chose #{computer_choice.upcase}.")
  display_winner(user_choice, computer_choice)

  prompt("Do you want to play again? (Y to replay)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
