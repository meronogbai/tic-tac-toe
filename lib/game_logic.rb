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

def subset?(win, arr)
  win.all? { |x| arr.include? x }
end

def did_i_win(taken_fields)
  arr = split_player_moves(taken_fields)
  if taken_fields.length.even?
    WIN_CONDITIONS.each do |win|
      return 'Player 2 wins' if subset?(win, arr[1])
    end
  else
    WIN_CONDITIONS.each do |win|
      return 'Player 1 wins' if subset?(win, arr[0])
    end
end
end

def who_is_next(taken_fields)
  if taken_fields.length.even?
    'starting player is next'
  else
    'second player is next'
  end
end

class Board
  def initialize
    @first = '   '
    @second = '   '
    @third = '   '
    @fourth = '   '
    @fifth = '   '
    @sixth = '   '
    @seventh = '   '
    @eighth = '   '
    @ninth = '   '
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

    fill_board(first_player_moves, ' x ')
    fill_board(second_player_moves, ' o ')

    puts "#{@first}|#{@second}|#{@third}"
    puts '-----------'
    puts "#{@fourth}|#{@fifth}|#{@sixth}"
    puts '-----------'
    puts "#{@seventh}|#{@eighth}|#{@ninth}"
  end
end
