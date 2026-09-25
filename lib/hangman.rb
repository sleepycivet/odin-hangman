require_relative 'hangman/display'
require_relative 'hangman/dictionary'
require_relative 'hangman/text'
require_relative 'hangman/game_data'
require_relative 'hangman/prompt'

class Game
  include Display
  include Dictionary
  include Text
  include Prompt

  def initialize
    @dictionary = create_dictionary
    @current_game_data
  end

  def new_game
    random_index = rand(@dictionary.length - 1)
    @current_game_data = GameData.new(@dictionary[random_index])
    display_results(@current_game_data)
    p @current_game_data
    prompt_guess
  end
end

# ✅ Read dictionary file
# Compare guess to answer
# - Guess whole word
# - Guess letter
# Display incorrect guesses
# ✅ Generate hangman graphic
# Create save file
# - Name save file
# Open save file
# Display saved games
# 
# Game = {
#   name: "Milk Tea's Save"
#   correct: [a,_,_,l,e],
#   incorrect: [b,r,v,k],
#   answer: "apple"
# }
# 
# word: a _ _ l e
# ----
# |  O
# | /|\
# | / \
# ======
# incorrect: b, r, v, k