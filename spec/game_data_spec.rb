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
  describe 'writing save files' do
    let(:test_object) {GameData.new('peanut')}
    let(:object_name) {'sweet-soup'}
    let(:test_object2) {GameData.new('apple')}
    it 'create a file' do
      test_object.guess = ['_','e','a','_','_','_']
      test_object.incorrect = ['v','b']
      test_object.name = object_name
      test_object.save_game
      expect(File.exist?("#{test_object.name}.json")).to be true
    end
    it 'write to a file' do
      test_object.guess = ['_','e','a','_','_','_']
      test_object.incorrect = ['v','b']
      test_object.name = object_name
      test_object2.guess = ['a','_','_','l','e']
      test_object2.name = 'apple-pie'
      test_object2.incorrect = ['t','n']
      test_object2.load_game("#{object_name}")
      expect(test_object2.answer).to eq('peanut')
    end
    it 'clean up created file' do
      File.delete("#{object_name}.json")
    end
  end
end