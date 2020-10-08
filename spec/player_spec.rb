require_relative '../lib/player.rb'

describe Enumerable do
  let(:player) { Player.new }

  describe '#name_check' do
    it 'checks if name of player is a string' do
      expect(player.name_check('string')).to eql(0)
    end
    it 'does not return 0 if name of player is not as string' do
      expect(player.name_check(3)).not_to eql(0)
    end
    it 'does not return 0 if name of player is empty' do
      expect(player.name_check('')).not_to eql(0)
    end
  end
end
