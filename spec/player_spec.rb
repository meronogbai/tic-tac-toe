require_relative '../lib/player.rb'

describe Enumerable do
  let(:player) { Player.new }

  describe '#name_check' do
    it 'checks if name of player is a string' do
      expect(player.name_check('string')).to eql(0)
    end
    it 'returns nil if name of player is not as string' do
      expect(player.name_check(3)).to eql(nil)
    end
    it 'returns nil if name of player is empty' do
      expect(player.name_check('')).to eql(nil)
    end
  end
end
