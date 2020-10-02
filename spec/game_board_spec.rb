require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
describe Game do
  describe '#taken_fields' do
    game = Game.new
    it 'Checks if we can read taken fields' do
      expect(game.taken_fields).to eql []
    end
    it 'Checks if we can update taken fields' do
      game.taken_fields = [1, 2, 3, 4, 5, 6, 8, 7]
      expect(game.taken_fields.push(9)).to eql [1, 2, 3, 4, 5, 6, 8, 7, 9]
    end
    it 'Test game draw' do
      expect(game.taken_fields.length).to eql 9
    end
  end
  describe '#field_validation' do
    game = Game.new
    game.taken_fields = [1, 7, 2, 6, 3]
    it 'Checks if field taken' do
      expect(game.field_validation(1)).to eql(0)
      expect(game.field_validation(10)).not_to eql(0)
    end
    it 'Check if field not taken' do
      expect(game.field_validation(4)).to eql(game.taken_fields.push(4))
    end
  end
  describe '#split_player_moves' do
    game = Game.new
    game.taken_fields = [1, 7, 2, 6, 3]
    it 'Checks if split player moves works' do
      expect(game.split_player_moves).to eql([[1, 2, 3], [7, 6]])
    end
  end
  describe '#did_i_win' do
    game = Game.new
    it 'Checks if player 1 wins the game' do
      game.taken_fields = [1, 7, 2, 6, 3]
      expect(game.did_i_win).to eql(1)
    end
    it 'Checks if player 1 wins the game' do
      game.taken_fields = [7, 1, 6, 2, 5, 3]
      expect(game.did_i_win).to eql(2)
    end
  end
  describe '#who_is_next' do
    game = Game.new
    game.taken_fields = [1, 7, 2, 6, 3]
    it 'Checks if turn changer works' do
      expect(game.who_is_next).to eql(2)
      expect(game.who_is_next).not_to eql(1)
    end
  end
end

describe Board do
  describe '#display_board' do
    game = Game.new
    game.taken_fields = [1, 7, 2, 6, 3]
    it 'Displays board' do
      expect(game.board.display_board(game)).to eql([
                                                      ' x | x | x ',
                                                      '-----------',
                                                      '   |   | o ',
                                                      '-----------',
                                                      ' o |   |   '
                                                    ])
    end
  end
end
