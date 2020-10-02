class Game
  attr_reader :board
  attr_accessor :taken_fields
  WIN_CONDITIONS = [[1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [1, 5, 9],
                    [3, 5, 7],
                    [1, 4, 7],
                    [2, 5, 8],
                    [3, 6, 9]].freeze
  def initialize
    @taken_fields = []
    @board = Board.new
  end

  def field_validation(move)
    if (1..9).include?(move)
      if @taken_fields.include?(move)
        0
      else
        @taken_fields.push(move)
      end
    else
      1
    end
  end

  def split_player_moves
    first_player_moves, second_player_moves = @taken_fields.partition.with_index { |_, i| i.even? }
    [first_player_moves, second_player_moves]
  end

  def subset?(win, arr)
    win.all? { |x| arr.include? x }
  end

  def did_i_win
    arr = split_player_moves
    if @taken_fields.length.even?
      WIN_CONDITIONS.each do |win|
        return 2 if subset?(win, arr[1])
      end
    else
      WIN_CONDITIONS.each do |win|
        return 1 if subset?(win, arr[0])
      end
    end
  end

  def who_is_next
    if @taken_fields.length.even?
      1
    else
      2
    end
  end
end
