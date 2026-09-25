class GameData
  attr_accessor :name, :guess, :incorrect
  attr_reader :answer

  private
  def initialize(answer)
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