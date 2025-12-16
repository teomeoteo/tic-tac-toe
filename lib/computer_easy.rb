class ComputerEasy < Player
  attr_accessor :symbol
  def initialize(symbol = nil)
    @symbol = symbol
  end
  def move
      (1..9).to_a.sample
  end
end
