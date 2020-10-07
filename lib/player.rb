class Player
  attr_reader :name
  @names = []
  def initialize(input, error)
    loop do
      @name = input.call
      if @name.to_i.zero? && !@name.empty? && !self.class.names.include?(@name)
        self.class.names.push(@name)
        break
      else
        error.call
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

test = Player.new('test', 'error')
puts test.random_player_start('marco')