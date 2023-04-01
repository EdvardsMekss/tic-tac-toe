class Board
  attr_accessor :fields

  def initialize
    @fields = Array.new(3) { Array.new(3, '-') }
  end

  def print_board
    fields.each do |row|
      puts row.join(' ')
    end
  end
  
  def make_move(row, column, char)
    fields[row][column] = char
  end
  


end
  
  new_board = Board.new
  new_board.make_move(1, 2, 'X')
  new_board.make_move(1, 1, 'X')
  new_board.print_board