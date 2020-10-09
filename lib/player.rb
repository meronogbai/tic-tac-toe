class Player
  def name_check(name_of_player)
    0 if name_of_player.to_i.zero? && !name_of_player.empty?
  end
end
