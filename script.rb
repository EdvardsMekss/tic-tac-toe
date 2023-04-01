class Board
    attr_accessor :fields, :free_fields
  
    def initialize
      @fields = Array.new(3) { Array.new(3, '-') }
    end
  
    def print_board
      fields.each do |row|
        puts row.join(' ')
      end
    end
    
    def make_move(row, column, char)
      if fields[row][column] == '-'
        fields[row][column] = char
      else
        puts "Field taken! Choose another!"
        return false
      end
    end

    def check_if_free(row, column)
      if fields[row][column] == '-'
        return true
      else
        return false
      end
    end
  
    def check_winner
      # check rows
      fields.each do |row|
        if row.all? { |position| position == 'X' }
          return 'X'
        elsif row.all? { |position| position == 'O' }
          return 'O'
        end
      end
  
      # check columns
      fields.transpose.each do |col|
        if col.all? { |position| position == 'X' }
          return 'X'
        elsif col.all? { |position| position == 'O' }
          return 'O'
        end
      end
  
      # check diagonals
      if (fields[0][0] == 'X' && fields[1][1] == 'X' && fields[2][2] == 'X') ||
         (fields[0][2] == 'X' && fields[1][1] == 'X' && fields[2][0] == 'X')
        return 'X'
      elsif (fields[0][0] == 'O' && fields[1][1] == 'O' && fields[2][2] == 'O') ||
            (fields[0][2] == 'O' && fields[1][1] == 'O' && fields[2][0] == 'O')
        return 'O'
      end
  
      # no winner yet
      return nil
    end
  
    def declare_result(result)
      case result
      when 'X'
        puts 'X is the winner!'
      when 'O'
        puts 'O is the winner!'
      else
        puts 'Draw!'
      end
    end
  end
  
  new_board = Board.new
  new_board.print_board
  
  # game loop
  (1..9).each do |move|
    player = move.odd? ? 'X' : 'O'
    
    field_free = false
    while field_free == false
      puts "Player #{player}, make your move:"
      row = gets.chomp.to_i
      column = gets.chomp.to_i
      field_free = new_board.check_if_free(row, column)
    end

    new_board.make_move(row, column, player)
    new_board.print_board
    if new_board.check_winner != nil
      result = new_board.check_winner
      new_board.declare_result(result)
      break
    end
  
    if move == 9
      result = new_board.check_winner
      new_board.declare_result(result)
    end
  end
  