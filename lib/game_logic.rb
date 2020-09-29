def random_player_start(player_1, player_2)
  players = [player_1, player_2]
  players.shuffle
end

def validation(move)
  (1..9).include?(move)
end

 