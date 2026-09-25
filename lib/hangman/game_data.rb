class GameData
  attr_accessor :name, :correct, :incorrect
  attr_reader :answer

  private
  def initialize(answer)
    @answer = answer
    @correct = []
    @incorrect = []
    set_correct
  end

  def set_correct
    (@answer.length).times do
      correct.push('_')
    end
    return @correct
  end
end

# Game = {
#   save_name: "Milk Tea's Save"
#   correct: [a,_,_,l,e],
#   incorrect: [b,r,v,k],
#   answer: "apple"
# }