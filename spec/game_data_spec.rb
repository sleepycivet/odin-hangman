require_relative '../lib/hangman/game_data'
RSpec.describe GameData, 'class' do
  describe 'checking data structure' do
    # let(:test_game_data) {GameData.new(test_answer)}
    subject {GameData.new(test_answer)}
    # let(:test_guess) {test_game_data.data[:guess]}
    let(:test_answer) {'apple'}
    let(:test_guess) {subject.guess}
    let(:test_incorrect) {subject.incorrect}
    it 'instantiates with answer, guess (with the correct amount of spaces), and incorrect' do
      expect(subject).to have_attributes(:answer => "apple", :guess => ['_','_','_','_','_'], :incorrect => [])
    end
    it 'guess and incorrect should be arrays' do
      expect(test_guess).to be_an(Array)
      expect(test_incorrect).to be_an(Array)
    end
  end
end