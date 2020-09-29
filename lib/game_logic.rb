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
      unless taken_fields.include?(move)
        taken_fields.push(move)
      else
        return "Taken Field Error"
      end
    else
      return "No Integer Error"
    end
  end


end

