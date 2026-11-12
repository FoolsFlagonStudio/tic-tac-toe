class Board
    def initialize
        @board = Array.new(3) do |row|
            Array.new(3) { |col| (row * 3) + col + 1 }
        end
    end

    def print_board
        @board.each do |row|
            puts row.join(" ")
        end
    end

    def update_board(position, symbol)
        # check if value provided is valid for given board
        if !position.between?(1, 9)
            raise ArgumentError, "Selected position out of bounds"
        end
        # adjust provided position for 0 based indexing
        position -= 1
        # check if value at requested position in matrix is an integer if its not return error
        if !@board[position / @board[0].length][position % @board[0].length].is_a?(Integer)
            raise ArgumentError, "Spot already taken"
        end
        # if it is an integer it can be taken and we update the value to the players symbol
        @board[position / @board[0].length][position % @board[0].length] = symbol
    end
end