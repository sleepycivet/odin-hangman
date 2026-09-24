require_relative '../lib/hangman/game_data'
RSpec.describe 'GameData class' do
  let(:test_answer) {'apple'}
  let(:test_game_data) {GameData.new(test_answer)}
  let(:test_correct) {test_game_data.correct}
  it 'sets correct to the appropriate length on init' do
    expected_result = test_answer.length
    expect(test_correct.length).to eq(expected_result)
  end
end