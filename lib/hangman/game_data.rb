class GameData
  require 'json'

  def objectize
    return {
      :name => @name,
      :answer => @answer,
      :guess => @guess,
      :incorrect => @incorrect
    }
  end

  def digest_guess(letter)
    if @incorrect.include?(letter) || @guess.include?(letter)
      puts "You already guessed this letter!"
    elsif answer.split('').include?(letter)
      answer_array = answer.split('')
      answer_array.each_with_index do |element, index|
        if element == letter
          @guess[index] = letter
        end
      end
    else
      @incorrect.push(letter)
    end
  end

  def save_game
    if @name == nil
      puts "Please pick a name for your save file:"
      @name = save_file_name('save')
    end
    file = File.new("#{@name}.json",'w')
    file.write(to_json)
    file.close
  end

  def load_game
    puts 'Please pick a save file to load:'
    show_saved_games
    file_name = save_file_name('load') + ".json"
    if File.exist?(file_name)
      from_json(File.open(file_name))
    else
      puts "Sorry, that save file doesn't exist."
    end
  end
  
  protected

  attr_accessor :name, :guess, :incorrect
  attr_reader :answer

  def to_json
    return JSON.dump(objectize)
  end

  def from_json(string)
    data = JSON.load(string)
    @name = data['name']
    @answer = data['answer']
    @guess = data['guess']
    @incorrect = data['incorrect']
  end

  def initialize(answer)
    @name = nil
    @answer = answer
    @guess = []
    @incorrect = []
    set_correct
    if Dir.pwd.include?('saves') == false
      Dir.chdir('saves')
    end
  end

  def set_correct
    (@answer.length).times do
      guess.push('_')
    end
    return @guess
  end

    def show_saved_games
    puts "Saved games:"
    Dir.children(Dir.pwd).each do |element|
      puts"- #{File.basename(element, '.*')}"
    end
  end

  def save_file_name(string)
    save_name = nil
    while save_name == nil
      input = gets.downcase.to_s.chomp

      if string == 'save'
        if File.exist?("#{input}.json") == false
          save_name = input
        else
          puts "That file already exists. Please try another one."
          show_saved_games
        end
      elsif string == 'load'
        if File.exist?("#{input}.json") == true
          save_name = input
        else
          puts "There is no such save file. Please choose one from the following:"
          show_saved_games
        end
      end
    end
    return save_name
  end

end

# Game = {
#   save_name: "Milk Tea's Save"
#   guess: [a,_,_,l,e],
#   incorrect: [b,r,v,k],
#   answer: "apple"
# }