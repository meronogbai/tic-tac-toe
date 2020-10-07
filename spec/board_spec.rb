require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

describe Enumerable do
  let(:board) { Board.new }
  let(:game) { Game.new }

  describe '#display_board' do
    it 'updates and displays board' do
      game.taken_fields = [1, 7, 2, 6, 3]
      expect(game.board.display_board(game)).to eql([
        " x | x | x ", 
        "-----------", 
        "   |   | o ", 
        "-----------", 
        " o |   |   "])
    end
  end

end