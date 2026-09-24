module GameDisplay
  def initialize
    @game_display_result
  end

  def display_result( num_incorrect)

    case num_incorrect
    when 0
      @game_display_result = "----\n|\n|\n|\n======\n"
    when 1
      @game_display_result = "----\n|  O\n|\n|\n======\n"
    when 2
      @game_display_result = "----\n|  O\n|  |\n|\n======\n"
    when 3
      @game_display_result = "----\n|  O\n| /|\n|\n======\n"
    when 4
      @game_display_result =
      "----\n|  O\n| /|\\\n|\n======\n"
    when 5
      @game_display_result = 
      "----\n|  O\n| /|\\\n| / \n======\n"
    else
      @game_display_result = 
      "----\n|  O < Game Over ;_;\n| /|\\\n| / \\\n======\n"
    end

    puts @game_display_result
    return @game_display_result
  end
end