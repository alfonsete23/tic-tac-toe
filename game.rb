require 'set'

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
    # Print the board
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

    # Check the winner using the helper functions defined to check rows, columns and diagonals
    def check_winner
        if winner = check_rows
            return winner
        elsif winner = check_columns
            return winner
        elsif winner = check_diagonals
            return winner
        else
            return
        end
    end

    private
    # Turn rows into sets and check if their length is 1    
    def check_rows
        @board.each do |row|
            if row.to_set.length == 1
                return row[0]
            else
                return
            end
        end
    end

    # Turn columns into sets and check if their length is 1
    def check_columns
        (0..2).each do |i|
            # Create array for the column to check
            col = []
            (0..2).each do |j|
                col.push(@board[j][i])
            end
            # Check like previously, turning it into a set and checking if its length is 1
            if col.to_set.length == 1
                return col[0]
            end 
        end
        return
    end

    #Turn diagonals into sets and check if their length is 1
    def check_diagonals
        # Initialize diagonals
        d1 = [@board[0][0], @board[1][1], @board[2][2]]
        d2 = [@board[0][2], @board[1][1], @board[2][0]]
        # Turn them into sets and check if length is 1
        if d1.to_set.length == 1
            return d1[0]
        elsif d2.to_set.length == 1
            return d2[0]
        else
            return
        end
    end
end

game = Board.new
game.check_winner
while true do
    game.display_board
    puts "Make your move"
    move = gets.to_i
    game.move("X", move)
    if winner = game.check_winner
        game.display_board
        puts "#{winner} wins!"
        break
    end
end