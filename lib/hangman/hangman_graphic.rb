module HangmanGraphic
  def initialize
    @graphic_data
  end

  def display_graphic( num_incorrect)
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
    return @graphic_data
  end
end