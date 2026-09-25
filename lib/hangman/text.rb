module Text
  def text_welcome
    puts "Welcome to Hangman!"
    puts "You will be guessing a random word, letter by letter."
    # puts "Would you like start a new game or load a saved game?"
  end

  def text_prompt_new_or_load_game
    puts "If you would like to start a new game, type 'new game'."
    puts "If you would like to load a game, type 'load game'."
  end

  def text_display_correct(correct_arr)
    puts "word: " + correct_arr.join(" ")
  end

  def text_display_incorrect(incorrect_arr)
    puts "incorrect: " + incorrect_arr.join(", ")
  end
  
  def text_prompt_guess_error
    puts 'Please type a letter from a to z.'
  end
end