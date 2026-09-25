require_relative '../lib/hangman'
RSpec.describe Game, 'class' do
  let(:test_game) {Game.new}
  it "returns true when guess matches" do
    test_game_obj = instance_double('GameData', :answer => 'apple', :guess => ['a','p','p','l','e'])
    expect(test_game.has_won?(test_game_obj)).to be true
  end
  it "returns false when the guess doesn't match" do
    test_game_obj = instance_double('GameData', :answer => 'apple', :guess => ['a','_','_','l','e'])
    expect(test_game.has_won?(test_game_obj)).to be false
  end
end