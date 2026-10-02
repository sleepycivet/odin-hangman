class GameData
  require 'json'

  def digest_guess(letter)

  end

  def save_game
    if Dir.pwd.include?('saves')
    else
      Dir.chdir('saves')
    end
    file = File.new("#{@name}.json",'w')
    file.write(to_json)
    file.close
  end

  def load_game(save_file_name)
    if Dir.pwd.include?('saves')
    else
      Dir.chdir('saves')
    end
    file_name = save_file_name + ".json"
    if File.exist?(file_name)
      from_json(File.open(file_name))
    else
      puts "Sorry, that save file doesn't exist."
    end
  end
  
  attr_accessor :name, :guess, :incorrect

  attr_reader :answer

  protected

  def to_json
    return JSON.dump({
      :name => @name,
      :answer => @answer,
      :guess => @guess,
      :incorrect => @incorrect}
    )
  end

  def from_json(string)
    data = JSON.load(string)
    @name = data['name']
    @answer = data['answer']
    @guess = data['guess']
    @incorrect = data['incorrect']
  end

  def initialize(answer)
    @name = 'unnamed'
    @answer = answer
    @guess = []
    @incorrect = []
    set_correct
  end

  def set_correct
    (@answer.length).times do
      guess.push('_')
    end
    return @guess
  end
end

# Game = {
#   save_name: "Milk Tea's Save"
#   correct: [a,_,_,l,e],
#   incorrect: [b,r,v,k],
#   answer: "apple"
# }