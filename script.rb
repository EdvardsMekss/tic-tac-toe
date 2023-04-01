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
  end
  
  new_board = Board.new
  new_board.print_board
  