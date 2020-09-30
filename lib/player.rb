class Player
  attr_reader :name
  @names = []
  def initialize(name)
    @name = name
  end

  class << self
    attr_reader :names
  end

  def random_player_start(second_player)
    players = [name, second_player.name]
    players.shuffle
  end
end
