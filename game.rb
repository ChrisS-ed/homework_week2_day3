class Game
  def initialize
    @board = [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil] ]
    @pieces = [:o, :x]
    @turn = 0
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
    @board[row][column] = @pieces[@turn % 2]
    puts "\n" + display_board  
    if has_won?(@pieces[@turn % 2])
      puts "\nGame over: #{@pieces[@turn % 2]} has won!"
    else
       @turn += 1
      board_full?
    end
  end

  def reset_board
    @board = [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil] ]
    @turn = 0
    @pieces = @pieces.rotate
  end

  def has_won?(symbol)
    horizontal_line?(symbol, @board) ||
    vertical_line?(symbol) ||
    diagonal_line?(symbol)
  end

  def horizontal_line?(symbol, board)
    board.any? do |row|
      row_has_winning_line(row, symbol)
    end
  end

  def vertical_line?(symbol)
    transposed_board = @board.transpose
    horizontal_line?(symbol, transposed_board)
  end

  def diagonal_line?(symbol)
    middle_piece = @board[1][1]
    return false if middle_piece != symbol
    top_left_and_bottom_right = @board[0][0] == symbol && @board[2][2] == symbol
    top_right_and_bottom_left = @board[0][2] == symbol && @board[2][0] == symbol
    top_left_and_bottom_right || top_right_and_bottom_left
  end

  def row_has_winning_line(row, symbol)
    row.all? do |square|
      square == symbol
    end 
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