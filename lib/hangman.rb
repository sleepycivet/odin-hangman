require_relative 'hangman/display'
require_relative 'hangman/dictionary'
require_relative 'hangman/text'
require_relative 'hangman/game_data'

class Game
  include Display
  include Dictionary
  include Text

  def initialize
    @number_of_guesses = 0
    @dictionary = create_dictionary
  end

  def new_game
    random_index = rand(@dictionary.length - 1)
    @current_game_data = GameData.new(@dictionary[random_index])
  end

  def play
    new_game
    game_saved = false

    text_welcome
    if Dir.pwd.include?('saves') == false
      Dir.chdir('saves')
    end
    if Dir.children(Dir.pwd).length > 0
      puts "Would you like start a new game or load a saved game?"
      if prompt_load_or_new == 'load'
        @current_game_data.load_game
      end
    end

    until has_won?(@current_game_data.objectize) ||  game_saved || @current_game_data.objectize[:incorrect].length == 6
      display_results(@current_game_data.objectize)
      input = nil
      while input == nil
        get = gets.downcase.to_s.chomp
        if get == 'save'
          input = get
        elsif /[a-z]/.match?(get) && get.length == 1
          input = get
        else
          puts "Enter a letter to guess or type 'save' to save your game."
        end
      end

      if input == 'save'
        game_saved = true
        @current_game_data.save_game
        puts "Game saved. Ending currently active game."
      else
        @current_game_data.digest_guess(input)
      end
    end

    if has_won?(@current_game_data.objectize)
      display_results(@current_game_data.objectize)
      puts "Congratulations, you won!"
      if File.exist?("#{@current_game_data.objectize[:name]}.json")
        File.delete("#{@current_game_data.objectize[:name]}.json")
      end
    elsif @current_game_data.objectize[:incorrect].length == 6
      display_results(@current_game_data.objectize)
      puts "answer: #{@current_game_data.objectize[:answer]}"
      puts "Game over. You lost. ;_;"
      if File.exist?("#{@current_game_data.objectize[:name]}.json")
        File.delete("#{@current_game_data.objectize[:name]}.json")
      end
    end
  end

  def prompt_load_or_new
    game_type = nil
    while game_type == nil
      input = gets.downcase.to_s.chomp
      if input == 'new' || input == 'load'
        game_type = input
      else
        puts "Please type 'new' or 'load'"
      end
    end
    return game_type
  end

  def has_won?(game_obj)
    if game_obj[:answer] == game_obj[:guess].join("")
      return true
    else
      return false
    end
  end
end

# ✅ Read dictionary file
# ✅ Compare guess to answer
# ✅ Guess letter
# ✅ Display incorrect guesses
# ✅ Generate hangman graphic
# ✅ Update game data with guess
# ✅ Did the player already guess that letter?

# ✅ Create save file
# ✅ Name save file
# ✅ Open save file
# ✅ What to do when save name is taken
# ✅ Display saved games

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

# Milktea Save JSON
# {"name":"milktea","answer":"honey","guess":["_","_","_","_","y"],"incorrect":["s","v"]}