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
