class Player
  attr_reader :name
  @names = []
  def initialize
    loop do
      @name = gets.chomp
      if @name.to_i.zero? && !@name.empty? && !self.class.names.include?(@name)
        self.class.names.push(@name)
        break
      else
        puts "Please input a valid name that's not an integer or empty or already taken."
      end
    end
  end

  class << self
    attr_reader :names
  end

  def random_player_start(second_player)
    players = [name, second_player.name]
    players.shuffle
  end
end

class Game
  WIN_CONDITIONS = [[1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [1, 5, 9],
                    [3, 5, 7],
                    [1, 4, 7],
                    [2, 5, 8],
                    [3, 6, 9]].freeze

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
end

class Board
  def initialize
    @initialize_board = ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ']
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def fill_board(player, symbol)
    player.each do |x|
      case x
      when 1 then @initialize_board[0] = symbol
      when 2 then @initialize_board[1] = symbol
      when 3 then @initialize_board[2] = symbol
      when 4 then @initialize_board[3] = symbol
      when 5 then @initialize_board[4] = symbol
      when 6 then @initialize_board[5] = symbol
      when 7 then @initialize_board[6] = symbol
      when 8 then @initialize_board[7] = symbol
      when 9 then @initialize_board[8] = symbol
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def display_board(taken_fields)
    first_player_moves = Game.new.split_player_moves(taken_fields)[0]
    second_player_moves = Game.new.split_player_moves(taken_fields)[1]

    fill_board(first_player_moves, ' x ')
    fill_board(second_player_moves, ' o ')

    ["#{@initialize_board[0]}|#{@initialize_board[1]}|#{@initialize_board[2]}",
     '-----------',
     "#{@initialize_board[3]}|#{@initialize_board[4]}|#{@initialize_board[5]}",
     '-----------',
     "#{@initialize_board[6]}|#{@initialize_board[7]}|#{@initialize_board[8]}"]
  end
end
