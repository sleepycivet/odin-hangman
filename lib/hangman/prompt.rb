require_relative 'text'

module Prompt
  include Text

  def prompt_guess
    text_prompt_guess
    guess = nil
    while guess == nil do
      begin
        input = gets.downcase.to_s.chomp
      rescue
        text_prompt_guess
      else
        if input.match?(/[a-z]/) && input.length == 1
          guess = input
        else
          text_prompt_guess
        end
      end
    end
    return guess
  end
end