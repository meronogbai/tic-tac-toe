require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

describe Game do
  let(:game) { Game.new }

  describe '#field_validation' do
    it 'returns 1 if input is not a number between 1 and 9' do
      expect(game.field_validation(10)).to eql(1)
    end
    it 'returns 0 if taken_fields already includes input' do
      game.field_validation(1)
      expect(game.field_validation(1)).to eql(0)
    end
    it 'pushes input to taken_fields if not already there' do
      game.field_validation(1)
      expect(game.field_validation(2)).to eql([1, 2])
    end
  end

  describe '#split_player_moves' do
    it 'splits taken_fields into two arrays with odd and even indexes respectively' do
      game.taken_fields = [1, 2, 3, 4]
      expect(game.split_player_moves).to eql([[1, 3], [2, 4]])
    end
  end

  describe '#subset?' do
    it 'checks if certain elements are included in arr' do
      expect(game.subset?([1, 2], [1, 2, 3])).to eql(true)
    end
    it 'does not check for the order of elements' do
      expect(game.subset?([3, 1], [1, 2, 3])).to eql(true)
    end
    it 'returns false if elements are not included in arr' do
      expect(game.subset?([4, 1], [1, 2, 3])).to eql(false)
    end
  end

  describe '#did_i_win' do
    it 'returns 1 when starting player wins the game' do
      game.taken_fields = [1, 4, 2, 5, 3]
      expect(game.did_i_win).to eql(1)
    end
    it 'returns 2 when starting player wins the game' do
      game.taken_fields = [1, 4, 2, 5, 8, 6]
      expect(game.did_i_win).to eql(2)
    end
  end

  describe '#who_is_next' do
    it 'returns 1 when starting player wins the game' do
      game.taken_fields = [1, 4, 2, 5, 3]
      expect(game.did_i_win).to eql(1)
    end
    it 'returns 2 when starting player wins the game' do
      game.taken_fields = [1, 4, 2, 5, 8, 6]
      expect(game.did_i_win).to eql(2)
    end
  end
end
