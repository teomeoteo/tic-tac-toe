require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  let(:player1) { double('Player', symbol: 'X') }
  let(:player2) { double('Player', symbol: 'O') }
  let(:players) { { player1: player1, player2: player2 } }
  let(:board) { Board.new }
  let(:game) { Game.new(players, board) }

  describe '#check_win' do
    it 'correctly checks if a player has won' do
      board.cells[0].update('X')
      board.cells[1].update('X')
      board.cells[2].update('X')

      expect(game.check_win).to be true
    end
  end

  describe '#update_cells' do
    it 'correctly sets a field on the board to a symbol' do
      expect { game.update_cell(2, player1.symbol) }.to change { board.cells[2] }
    end
  end

  
end