require_relative '../../odin-hangman/lib/hangman/dictionary'
RSpec.describe ' Dictionary module' do
  let(:dummy_class) { Class.new { extend Dictionary } }
  let(:final_dict) {dummy_class.create_dictionary}

  # PROTECTED METHODS VARIABLES
  # let(:file_array) {dummy_class.read_from_file}
  # let(:final_dict) {dummy_class.trim_dictionary(file_array)}

  # PROTECTED METHOD
  # describe 'reads from file' do
  #   it 'returns an array' do
  #     expect(file_array.class).to eq(Array)
  #   end
  #   it "array length is 7871" do
  #     expect(file_array.length).to eq(7871)
  #   end
  # end
  
  describe 'returns a final dictionary that' do
    it 'has more than 5000 words' do
      expect(final_dict.length).to be > 5000
    end
    it 'has no words less than 5 characters' do
      expect(final_dict.any?{|word| word.length < 5}).to be false
    end
    it 'has no words greater than 12 characters' do
      expect(final_dict.any?{|word| word.length > 12}).to be false
    end
  end
end