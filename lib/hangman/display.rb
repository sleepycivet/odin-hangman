require_relative 'text'

module Display
  include Text
  def initialize
    @graphic_data
  end

  def display_results(game_obj)
    text_display_correct(game_obj.correct)
    display_graphic(game_obj.incorrect.length)
    if game_obj.incorrect.length > 0
      text_display_incorrect(game_obj.incorrect)
    end
  end

  def display_graphic(num_incorrect)
    case num_incorrect
    when 0
      @graphic_data = "----\n|\n|\n|\n======\n"
    when 1
      @graphic_data = "----\n|  O\n|\n|\n======\n"
    when 2
      @graphic_data = "----\n|  O\n|  |\n|\n======\n"
    when 3
      @graphic_data = "----\n|  O\n| /|\n|\n======\n"
    when 4
      @graphic_data =
      "----\n|  O\n| /|\\\n|\n======\n"
    when 5
      @graphic_data = 
      "----\n|  O\n| /|\\\n| / \n======\n"
    else
      @graphic_data = 
      "----\n|  O < Game Over ;_;\n| /|\\\n| / \\\n======\n"
    end

    puts @graphic_data
  end
end