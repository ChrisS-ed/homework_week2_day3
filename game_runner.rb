require "pry-byebug"
require_relative("game")
require_relative("win_checker")
#require_relative("rubbish_win_checker")

# create game
win_checker_1 = WinChecker.new()
#rubbish = RubbishWinChecker.new()
game = Game.new(win_checker_1)
# place piece
game.place_piece(0,0)
# display board
puts game.display_board
# reset board
game.reset_board

game.place_piece(1,1)
puts game.display_board

game.reset_board
game.place_piece(2,2)
puts game.display_board

# don't allow putting pieces out of range
# rotate the starting piece when resetting
# automatically reset when the board is full and tell us it's a draw

game.reset_board
game.place_piece(0,0)
game.place_piece(0,1)
game.place_piece(0,2)
game.place_piece(1,0)
game.place_piece(1,1)
game.place_piece(1,2)
game.place_piece(2,0)
game.place_piece(2,1)
game.place_piece(2,2)


# automatically detect when someone has won and notify
# horizontal win
game.reset_board
piece = :o
game.place_piece(0,0)
game.place_piece(1,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)

# vertical win
game.reset_board
piece = :x
game.place_piece(0,2)
game.place_piece(1,0)
game.place_piece(1,2)
game.place_piece(1,1)
game.place_piece(2,2)

# diagonal win
game.reset_board
piece = :o
game.place_piece(0,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)
game.place_piece(2,2)
#puts "\nChecking if game is won: #{game.has_won?(piece)} expect to be true"



#binding.pry; " "














