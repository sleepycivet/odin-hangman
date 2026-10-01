class GameData
  require 'json'

  def save_game
    Dir.chdir('saves')
    puts "working directory = " + Dir.pwd
    file = File.new("#{@name}.json",'w')
    puts File.exist?("#{@name}.json")
    file.write(JSON.dump({
      :name => @name,
      :answer => @answer,
      :guess => @guess,
      :incorrect => @incorrect}
    ))
    file.close
  end

  def load_game(save_file_name)
    puts "working directory = " + Dir.pwd
    file_name = save_file_name + ".json"
    Dir.chdir('saves')
    puts "working directory = " + Dir.pwd
    puts "Does the file exist? #{File.exist?(file_name)}"
    if File.exist?(file_name)
      data = JSON.load(File.open(file_name))
      p data
      @name = data['name']
      @answer = data['answer']
      @guess = data['guess']
      @incorrect = data['incorrect']
    else
      puts "Sorry, that save file doesn't exist."
    end
  end
  
  attr_accessor :name, :guess, :incorrect

  attr_reader :answer

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