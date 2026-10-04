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
  describe 'digest_guess' do
    let(:test_object) {GameData.new('apple')}
    it 'already guessed the (correct) letter' do
      test_object.guess = ['a','_','_','l','e']
      test_object.incorrect = ['b','v','r','k']
      expected_output = "You already guessed this letter!\n"
      input = "a"
      expect{test_object.digest_guess(input)}.to output(expected_output).to_stdout
    end
    it 'already guessed the (incorrect) letter' do
      test_object.guess = ['a','_','_','l','e']
      test_object.incorrect = ['b','v','r','k']
      expected_output = "You already guessed this letter!\n"
      input = "b"
      expect{test_object.digest_guess(input)}.to output(expected_output).to_stdout
    end
    it 'guess correct letter (new)' do
      test_object.guess = ['a','_','_','_','e']
      test_object.incorrect = ['b','v','r','k']
      input = "l"
      test_object.digest_guess(input)
      expect(test_object.guess).to eq(['a','_','_','l','e'])
      expect(test_object.incorrect).to eq(['b','v','r','k'])
    end
    it 'guess incorrect letter (new)' do
      test_object.guess = ['a','_','_','_','e']
      test_object.incorrect = ['b','v','r','k']
      input = "z"
      test_object.digest_guess(input)
      expected_output = ['b','v','r','k','z']
      expect(test_object.incorrect).to eq(['b','v','r','k','z'])
    end
  end
end