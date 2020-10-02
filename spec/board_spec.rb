require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

describe Board do
  describe '#display_board' do
    game = Game.new
    game.taken_fields = [1, 7, 2, 6, 3]
    it 'Displays board' do
      expect(game.board.display_board(game)).to eql [
        ' x | x | x ',
        '-----------',
        '   |   | o ',
        '-----------',
        ' o |   |   '
      ]
    end
    it 'Displays board in negative case' do
      game = Game.new
      game.taken_fields = [1, 8, 2, 6, 3]
      expect(game.board.display_board(game)).not_to eql [
        ' x | x | x ',
        '-----------',
        '   |   | o ',
        '-----------',
        ' o |   |   '
      ]
    end
  end

  describe '#update' do
    it 'Updates board for x symbol' do
      game = Game.new
      game.board.update([1, 2, 3], ' x ')
      expect(game.board.display_board(game)).to eql [
        ' x | x | x ',
        '-----------',
        '   |   |   ',
        '-----------',
        '   |   |   '
      ]
    end
    it 'Updates board for o symbol' do
      game = Game.new
      game.board.update([4, 5, 6], ' o ')
      expect(game.board.display_board(game)).to eql [
        '   |   |   ',
        '-----------',
        ' o | o | o ',
        '-----------',
        '   |   |   '
      ]
    end
    it 'Updates board for o symbol in negative case' do
      game = Game.new
      game.board.update([4, 5, 6], ' o ')
      expect(game.board.display_board(game)).not_to eql [
        '   |   |   ',
        '-----------',
        ' o | o | x ',
        '-----------',
        '   |   |   '
      ]
    end
    it 'Updates board for x symbol in negative case' do
      game = Game.new
      game.board.update([1, 2, 3], ' x ')
      expect(game.board.display_board(game)).not_to eql [
        '   |   |   ',
        '-----------',
        ' x | x | x ',
        '-----------',
        '   |   |   '
      ]
    end
  end
end
