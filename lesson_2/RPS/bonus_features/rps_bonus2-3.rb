## Rock Paper Scissors Game

# Constant variables
GAME_CHOICES = { r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', k: 'spock' }
WIN_CONDITIONS = { spock: %w(scissors rock),
                   lizard: %w(spock paper),
                   rock: %w(lizard scissors),
                   paper: %w(rock spock),
                   scissors: %w(paper lizard) }

CHOICE_PROMPT = <<-MSG
Choose one:
     R for Rock
     P for Paper
     S for Scissors
     L for Lizard
     K for Spock
MSG

# Method defintion
def prompt(msg)
  puts "=> #{msg}"
end

def request_user_choice
  loop do
    prompt(CHOICE_PROMPT)
    user = gets.chomp.downcase.to_sym
    if GAME_CHOICES.keys.include?(user)
      return GAME_CHOICES[user]
    else
      prompt("That's not a valid choice.")
    end
  end
end

def make_computer_choice
  GAME_CHOICES.values.sample
end

def pick_winner(user, computer)
  if WIN_CONDITIONS[user.to_sym].include?(computer)
    "user"
  elsif user == computer
    "tie"
  else
    "computer"
  end
end

# Start of code
prompt("Welcome to Rock, Paper, Lizard, Spock!")
prompt("The first one to win 3 rounds wins the match!")

# Main loop
loop do
  user_wins = 0
  computer_wins = 0

  until user_wins == 3 || computer_wins == 3
    user_choice = request_user_choice()
    computer_choice = make_computer_choice()
    prompt("You chose: #{user_choice.upcase}")
    prompt("The computer chose: #{computer_choice.upcase}.")

    round_winner = pick_winner(user_choice, computer_choice)

    if round_winner == "user"
      user_wins += 1
      prompt("You won that round! #{user_wins}-#{computer_wins}\n\n")
    elsif round_winner == "tie"
      prompt("It's a tie! Go again. #{user_wins}-#{computer_wins}\n\n")
    else
      computer_wins += 1
      prompt("You lost that round... #{user_wins}-#{computer_wins}\n\n")
    end
  end

  prompt(if user_wins == 3
           "Match over. Congratulations, you're the grand winner!"
         else
           "Match over. Sorry, the computer is the grand winner..."
         end)

  prompt("Do you want to play again? (Y to replay)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
