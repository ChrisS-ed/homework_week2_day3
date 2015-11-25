class Game
  def initialize(win_checker)
    @board = [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil] ]
    @pieces = [:o, :x]
    @turn = 0
    @win_checker = win_checker
  end
  
  def display_board
    row_strings = @board.map do |row|
      row_to_string(row)
    end
    row_strings.join("\n_ _ _\n")
  end

  def place_piece(row, column)
    return false if (row < 0 or row > 2) or (column < 0 or column > 2)
    return false if @board[row][column]
    this_turn = @turn % 2
    @board[row][column] = @pieces[this_turn]
    @turn += 1
    puts "\n" + display_board  
    if @win_checker.has_won?(@pieces[this_turn], @board)
      puts "\nGame over: #{@pieces[this_turn]} has won in #{@turn} turns!"
    else
      board_full?
    end
  end

  def reset_board
    @board = [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil] ]
    @turn = 0
    @pieces = @pieces.rotate
  end

  private

    def row_to_string(row)
      row_symbols = row.map do |piece|
        piece || " "
      end
      row_symbols.join("|")
    end

    def board_full?
      if @board.flatten.all? then
        puts display_board
        puts "\nThe board is full ... resetting game\n\n"
        reset_board
      end
    end

end