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
