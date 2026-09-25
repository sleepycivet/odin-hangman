require_relative 'hangman/hangman_graphic'
require_relative 'hangman/dictionary'
require_relative 'hangman/text'
require_relative 'hangman/game_data'

class Game
  include HangmanGraphic
  include Dictionary
  include Text

  def initialize
    @dictionary = create_dictionary
    @current_game_data
  end

  def new_game
    random_index = rand(@dictionary.length - 1)
    @current_game_data = GameData.new(@dictionary[random_index])
    show_results
  end

  def show_results
    text_display_correct(current_game_data.correct)
    display_graphic(current_game_data.incorrect.length)
    if current_game_data.incorrect.length > 0
      text_display_incorrect(current_game_data.incorrect)
    end
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