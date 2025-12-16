WINNING_POSITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

class Game
  attr_reader :players, :board, :player1, :player2, :rule
  def initialize(players, board = Board.new, rule = WINNING_POSITIONS)
    @players = players
    @player1 = players[:player1]
    @player2 = players[:player2]
    @board = board
    @rule = rule
  end

  def start
    board.draw
    loop do
      if (board.cells.none? {|cell| cell.legal?})
        puts "It's a tie!"
        return
      end
      get_moves
      break if check_win
    end
  end
  
  def set_player_x(player)
    player.symbol = 'X'
  end

  def set_player_o(player)
    player.symbol = 'O'
  end

  def get_moves
    players.map do |player_key, player| 
      return if board.cells.none? {|cell| cell.legal?}
      puts "#{player_key}, whats your move?"

      loop do
        move = player.move - 1 # array indexing offset 
        if (board.cells[move].legal?)
          update_cell(move, player.symbol)
          board.draw
          if (check_win)
            puts "#{player_key} wins!"
            return
          end
          break [player, move]
        else
          puts "Invalid move, try again!"
        end
      end
    end.to_h
  end

  def update_cell(move, symbol)
    board.cells[move].update(symbol)
  end

  def check_win
    game_over = false
    rule.each do |combination|
      if ((combination & board.get_x).length >= 3)
        # puts "#{players.keys.find { |key| players[key].symbol == 'X'}} wins!"
        game_over = true
      elsif ((combination & board.get_o).length >= 3)
        # puts "#{players.keys.find { |key| players[key].symbol == 'O'}} wins!"
        game_over = true
      end
    end
    game_over
  end

end

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*- 

class Board
  attr_accessor :cells
  def initialize(fields = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @cells = Cell.new.boardify(fields)
  end

  def draw
    puts "#{cells[0].state} | #{cells[1].state} | #{cells[2].state}"
    puts "--*---*--"
    puts "#{cells[3].state} | #{cells[4].state} | #{cells[5].state}"
    puts "--*---*--"
    puts "#{cells[6].state} | #{cells[7].state} | #{cells[8].state}"
  end

  def get_x
    cells.map.with_index do |cell, index|
      cell.state == "X" ? [index + 1] : nil # index + 1 bcus its easier to compare
    end.compact.flatten
  end

  def get_o
    cells.map.with_index do |cell, index|
      cell.state == "O" ? [index + 1] : nil
    end.compact.flatten
  end

  Cell = Struct.new(:state)do
    def update(value)
      self.state = value
    end

    def boardify(fields)
      fields.map { |value| Cell.new(" ") }
    end

    def legal?
      state != 'X' && state != 'O'
    end
  end
end


#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

class Player
  attr_accessor :symbol
  def initialize(symbol = nil)
    @symbol = symbol
  end

  def move
    puts "Select a valid field!"
    loop do
      move = gets.to_i
      if (move.between?(1, 9))
        break move
      else
        puts "Please select a valid field"
      end
    end
  end
end

#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

class ComputerEasy < Player
  attr_accessor :symbol
  def initialize(symbol = nil)
    @symbol = symbol
  end
  def move
      (1..9).to_a.sample
  end
end

class ComputerHard < Player
  attr_accessor :symbol
  def initialize(symbol = nil)
    @symbol = symbol
  end
  def move
    
  end
end


=begin
my_players = {player1: Player.new, player2: Player.new}
game = Game.new(my_players)
game.set_player_x(game.player1)
game.set_player_o(game.player2)
# game.get_moves
game.start
# p game.board.get_x
=end

my_players = {player1: Player.new, player2: ComputerEasy.new}
game = Game.new(my_players)
game.set_player_x(game.player1)
game.set_player_o(game.player2)
# game.get_moves
game.start


