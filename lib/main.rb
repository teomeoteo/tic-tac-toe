require_relative 'game'
require_relative 'player'
require_relative 'computer_easy'
require_relative 'board'

WINNING_POSITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

def pvp
  my_players = {player1: Player.new, player2: Player.new}
  game = Game.new(my_players)
  game.set_player_x(game.player1)
  game.set_player_o(game.player2)
  game.start
end

def pvcpu
  my_players = {player1: Player.new, player2: ComputerEasy.new}
  game = Game.new(my_players)
  game.set_player_x(game.player1)
  game.set_player_o(game.player2)
  game.start
end

def choose_mode
  puts "Select 1 for PvP and 2 for PvCPU"
  loop do 
    option = gets.to_i
    if (option == 1)
      pvp
      return
    elsif (option == 2)
      pvcpu
      return
    else
      puts "Please choose either 1 or 2"
    end
  end
end
