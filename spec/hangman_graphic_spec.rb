require_relative '../lib/hangman/hangman_graphic'
# This is really straightforward, so I don't think this needs to be tested.
# Delete if this test is breaking.
RSpec.describe 'HangmanGraphic module' do
  let(:dummy_class) {Class.new {extend HangmanGraphic}}
  it 'returns the stand without a person with none wrong' do
    expected_output = "----\n|\n|\n|\n======\n"
    expect{dummy_class.display_graphic(0)}.to output(expected_output).to_stdout
  end
  it 'returns the stand with a head with 1 wrong' do
    expected_output = "----\n|  O\n|\n|\n======\n"
    expect{dummy_class.display_graphic(1)}.to output(expected_output).to_stdout
  end
  it 'returns the stand with a head with 2 wrong' do
    expected_output = "----\n|  O\n|  |\n|\n======\n"
    expect{dummy_class.display_graphic(2)}.to output(expected_output).to_stdout
  end
end