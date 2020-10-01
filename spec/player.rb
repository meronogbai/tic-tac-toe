require './lib/player.rb'
describe Player do
  input = proc { 'Meron' }
  error = proc do
    puts "Please input a valid name that's not an
    integer or empty or already taken."
  end
  player = Player.new(input, error)
end