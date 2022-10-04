class Board
    # Initialize a board with 3 rows of 3 positions
    def initialize
        @board = [
            [1, 2, 3], 
            [4, 5, 6], 
            [7, 8, 9]
        ]
        @delim = "---+---+---"
    end

    public
    # Print the board TODO: look for a cleaner way of doing this
    def display_board
        puts "#{@delim}"
        (0..2).each do |row|
            puts " #{@board[row][0]} | #{@board[row][1]} | #{@board[row][2]}"
            puts "#{@delim}"
        end
    end

    # Change the symbol in the provided position
    def move(symbol, position)
        # Get row
        row = ((position - 1) / 3).to_i
        # Get column
        col = (position - 1) % 3
        # Set move on the board
        @board[row][col] = symbol
    end

    #TODO
    def check_winner
        
    end
end

game = Board.new
game.move("X", 9)
game.display_board
