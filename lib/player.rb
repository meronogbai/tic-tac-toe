class Player
  attr_reader :name
  @names = []
  def initialize
    loop do
      @name = yield
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
