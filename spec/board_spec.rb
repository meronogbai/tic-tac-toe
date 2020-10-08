require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

describe Enumerable do
  let(:board) { Board.new }
  let(:game) { Game.new }

  describe '#display_board' do
    it 'splits taken fields and updates the board after every move' do
      game.taken_fields = [1, 4, 2, 5, 3]
      expect(game.board.display_board(game)).to eql([
                                                      ' x | x | x ',
                                                      '-----------',
                                                      ' o | o |   ',
                                                      '-----------',
                                                      '   |   |   '
                                                    ])
    end

    it 'splits taken fields and updates the board after every move' do
      game.taken_fields = [1, 4, 2, 5, 7, 6]
      expect(game.board.display_board(game)).to eql([
                                                      ' x | x |   ',
                                                      '-----------',
                                                      ' o | o | o ',
                                                      '-----------',
                                                      ' x |   |   '
                                                    ])
    end

    it 'splits taken fields and updates the board after every move' do
      game.taken_fields = [1, 4, 7, 5, 2, 8, 3]
      expect(game.board.display_board(game)).to eql([
                                                      ' x | x | x ',
                                                      '-----------',
                                                      ' o | o |   ',
                                                      '-----------',
                                                      ' x | o |   '
                                                    ])
    end

    it 'splits taken fields and updates the board after every move' do
      game.taken_fields = [1, 4, 2, 5, 7, 8, 6, 9, 3]
      expect(game.board.display_board(game)).to eql([
                                                      ' x | x | x ',
                                                      '-----------',
                                                      ' o | o | x ',
                                                      '-----------',
                                                      ' x | o | o '
                                                    ])
    end

    it 'splits taken fields and updates the board after every move' do
      game.taken_fields = [1, 2, 3, 7, 4, 9, 6, 8]
      expect(game.board.display_board(game)).to eql([
                                                      ' x | o | x ',
                                                      '-----------',
                                                      ' x |   | x ',
                                                      '-----------',
                                                      ' o | o | o '
                                                    ])
    end

    it 'splits taken fields and updates the board after every move' do
      game.taken_fields = [1, 5, 3, 2, 8, 4, 9, 6]
      expect(game.board.display_board(game)).to eql([
                                                      ' x | o | x ',
                                                      '-----------',
                                                      ' o | o | o ',
                                                      '-----------',
                                                      '   | x | x '
                                                    ])
    end

    it 'splits taken fields and updates the board after every move' do
      game.taken_fields = []
      expect(game.board.display_board(game)).to eql([
                                                      '   |   |   ',
                                                      '-----------',
                                                      '   |   |   ',
                                                      '-----------',
                                                      '   |   |   '
                                                    ])
    end
  end
end
