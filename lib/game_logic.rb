module Test
  WIN_CONDITIONS = [[1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [1, 5, 9],
                    [3, 5, 7],
                    [1, 4, 7],
                    [2, 5, 8],
                    [3, 6, 9]].freeze

  def random_player_start(player_1, player_2)
    players = [player_1, player_2]
    players.shuffle
  end

  def validation(move)
    (1..9).include?(move)
  end

  def field_validation(move, taken_fields)
    if (1..9).include?(move)
      if taken_fields.include?(move)
        'Taken Field Error'
      else
        taken_fields.push(move)
      end
    else
      'No Integer Error'
    end
  end

  def split_player_moves(taken_fields)
    first_player_moves, second_player_moves = taken_fields.partition.with_index { |_, i| i.even? }
    [first_player_moves, second_player_moves]
  end

  def did_i_win(taken_fields)
    arr = split_player_moves(taken_fields)
    if taken_fields.length % 2 == 0
      "Player 2 has won the game" if WIN_CONDITIONS.include?(arr[1])
    else
      "Player 1 has won the game" if WIN_CONDITIONS.include?(arr[0])
    end
  end
end

class Board
  include Test
  def initialize
    @first = ''
    @second = ''
    @third = ''
    @fourth = ''
    @fifth = ''
    @sixth = ''
    @seventh = ''
    @eighth = ''
    @ninth = ''
  end

  def fill_board(player, symbol)
    player.each do |x|
      case x
      when 1
        @first = symbol
      when 2
        @second = symbol
      when 3
        @third = symbol
      when 4
        @fourth = symbol
      when 5
        @fifth = symbol
      when 6
        @sixth = symbol
      when 7
        @seventh = symbol
      when 8
        @eighth = symbol
      when 9
        @ninth = symbol
      end
    end
  end

  def display_board(taken_fields)
    first_player_moves = split_player_moves(taken_fields)[0]
    second_player_moves = split_player_moves(taken_fields)[1]

    fill_board(first_player_moves, 'x')
    fill_board(second_player_moves, 'o')

    p "#{@first} | #{@second} | #{@third}"
    p '-----------'
    p "#{@fourth} | #{@fifth} | #{@sixth}"
    p '-----------'
    p "#{@seventh} | #{@eighth} | #{@ninth}"
  end
end
