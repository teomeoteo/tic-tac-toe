
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
