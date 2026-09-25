require_relative 'text'

module Prompt
  include Text

  def prompt_guess
    guess = nil
    while guess == nil do
      begin
        input = gets.downcase.to_s.chomp
      rescue
        text_prompt_guess_error
      else
        if input.match?(/[a-z]/) && input.length == 1
          guess = input
        else
          text_prompt_guess_error
        end
      end
    end
    return guess
  end
end