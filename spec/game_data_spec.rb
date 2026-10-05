require_relative '../lib/hangman/game_data'
RSpec.describe GameData, 'class' do
  describe 'checking data structure' do
    subject {GameData.new('apple')}
    it 'instantiates with answer, guess (with the correct amount of spaces), and incorrect' do
      expected_output = {
        :answer => 'apple',
        :guess => ['_','_','_','_','_'],
        :incorrect => [],
        :name => nil
      }
      expect(subject.objectize).to eq(expected_output)
    end
    it 'guess and incorrect should be arrays' do
      expect(subject.objectize[:guess]).to be_an(Array)
      expect(subject.objectize[:incorrect]).to be_an(Array)
    end
    it 'correctly reflects letters digested through digest_guess' do
      subject.digest_guess('a')
      subject.digest_guess('l')
      subject.digest_guess('e')
      subject.digest_guess('t')
      subject.digest_guess('n')
      expected_output = {
        :answer => "apple",
        :guess => ['a','_','_','l','e'],
        :incorrect => ['t','n'],
        :name => nil}
      expect(subject.objectize).to eq(expected_output)
    end
  end
  describe 'writing save files' do
    subject{GameData.new('peanut')}
    let(:object_name) {"mom's favorite soup"}
    before{
      subject.digest_guess('e')
      subject.digest_guess('a')
      subject.digest_guess('v')
      subject.digest_guess('b')
    }
    it 'create a file' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("#{object_name}")
      subject.save_game
      expect(File.exist?("#{object_name}.json")).to be true
    end
    it 'write to a file' do
      test_object2 = GameData.new('apple')
      test_object2.digest_guess('a')
      test_object2.digest_guess('l')
      test_object2.digest_guess('e')
      test_object2.digest_guess('t')
      test_object2.digest_guess('n')
      allow_any_instance_of(Kernel).to receive(:gets).and_return("#{object_name}")
      test_object2.load_game
      expect(test_object2.objectize[:answer]).to eq('peanut')
    end
    it 'clean up created file' do
      File.delete("#{object_name}.json")
    end
  end
  describe 'digest_guess' do
    subject{GameData.new('apple')}
    before{
      subject.digest_guess('a')
      subject.digest_guess('e')
      subject.digest_guess('t')
      subject.digest_guess('n')
      subject.digest_guess('b')
    }
    let(:already_guessed) {
      expected_output = "You already guessed this letter!\n"}
    it 'already guessed the (correct) letter' do
      input = "a"
      expect{subject.digest_guess(input)}.to output(already_guessed).to_stdout
    end
    it 'already guessed the (incorrect) letter' do
      input = "b"
      expect{subject.digest_guess(input)}.to output(already_guessed).to_stdout
    end
    it 'guess correct letter (new)' do
      input = "l"
      subject.digest_guess(input)
      expect(subject.objectize[:guess]).to eq(['a','_','_','l','e'])
    end
    it 'guess incorrect letter (new)' do
      input = "z"
      subject.digest_guess(input)
      expect(subject.objectize[:incorrect]).to eq(['t','n','b','z'])
    end
  end
end