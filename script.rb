class Board
    attr_accessor :fields
  
    def initialize(rows)
      @fields = Array.new(rows) { Array.new(3, '-') }
    end
  
    def print_board
      fields.each do |row|
        puts row.join(' ')
      end
    end
  end
  
  new_board = Board.new(3)
  new_board.print_board
  