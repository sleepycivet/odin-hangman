require_relative '../lib/hangman/game_display'
# This is really straightforward, so I don't think this needs to be tested.
# Delete if this test is breaking.
RSpec.describe 'GameDisplay module' do
  let(:dummy_class) {Class.new {extend GameDisplay}}
  it 'returns the stand without a person with none wrong' do
    expected_output = "----\n|\n|\n|\n======\n"
    expect{dummy_class.display_result(0)}.to output(expected_output).to_stdout
  end
  it 'returns the stand with a head with 1 wrong' do
    expected_output = "----\n|  O\n|\n|\n======\n"
    expect{dummy_class.display_result(1)}.to output(expected_output).to_stdout
  end
  it 'returns the stand with a head with 2 wrong' do
    expected_output = "----\n|  O\n|  |\n|\n======\n"
    expect{dummy_class.display_result(2)}.to output(expected_output).to_stdout
  end
end