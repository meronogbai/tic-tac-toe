require_relative '../lib/player.rb'
describe Player do
  input = proc { 'Meron' }
  error = proc do
    puts "Please input a valid name that's not an
    integer or empty or already taken."
  end
  player = Player.new(input, error)

  describe '#name' do
    it 'Checks if we can read name of player' do
      expect(player.name).to eql 'Meron'
    end
    it 'Checks negative case' do
      expect(player.name).not_to eql nil
    end
  end
  describe '#random_player_start' do
    input = proc { 'Avijit' }
    second_player = Player.new(input, error)
    it 'checks if rng works' do
      expect(player.random_player_start(second_player) - [player.name, second_player.name]).to eql([])
    end
  end
end
