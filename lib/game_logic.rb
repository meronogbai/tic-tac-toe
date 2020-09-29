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

  def display_board(taken_fields)
    "#{} | #{} | #{}
     #{} | #{} | #{}
     #{} | #{} | #{}
    "
  end
end
