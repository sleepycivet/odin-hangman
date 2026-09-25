require_relative '../lib/hangman/prompt'
RSpec.describe Prompt, 'module' do
  let(:dummy_class) {Class.new {extend Prompt} }
  let(:error_message) {"Please type a letter from a to z."}
  describe 'behaves correctly to various input' do
    # I can't figure out how to test errors without starting an endless loop when I run the test
    it "returns the letter to down case if capitalized" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("B")
      expect(dummy_class.prompt_guess).to eq("b")
    end
    it 'returns the letter if passed in a letter' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("k")
      expect(dummy_class.prompt_guess).to eq("k")
    end
  end
end