class Board
  def initialize
    @initialize_board = ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ']
  end

  def update(player, symbol)
    player.each do |move|
      @initialize_board[move - 1] = symbol
    end
  end

  def display_board(game)
    first_player_moves = game.split_player_moves[0]
    second_player_moves = game.split_player_moves[1]

    update(first_player_moves, ' x ')
    update(second_player_moves, ' o ')

    ["#{@initialize_board[0]}|#{@initialize_board[1]}|#{@initialize_board[2]}",
     '-----------',
     "#{@initialize_board[3]}|#{@initialize_board[4]}|#{@initialize_board[5]}",
     '-----------',
     "#{@initialize_board[6]}|#{@initialize_board[7]}|#{@initialize_board[8]}"]
  end
end
