module Test
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
end

class Board
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
    first_player_moves, second_player_moves = taken_fields.partition.with_index { |_, i| i.even? }

    fill_board(first_player_moves, 'x')
    fill_board(second_player_moves, 'o')

    p "#{@first} | #{@second} | #{@third}"
    p '-----------'
    p "#{@fourth} | #{@fifth} | #{@sixth}"
    p '-----------'
    p "#{@seventh} | #{@eighth} | #{@ninth}"
  end
end

include Test
testrun = Board.new
testrun.display_board([3, 2, 5, 7, 4, 8, 1, 9, 6])
