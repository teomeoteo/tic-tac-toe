require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#get_x' do
    it 'returns an array of all positions on the board which have X' do
      board.cells[0].update('X')
      board.cells[5].update('X')

      expect(board.get_x).to eq([1, 6])
    end
  end
end