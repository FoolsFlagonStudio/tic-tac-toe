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

    def get_size
        return @board[0].length
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

    def check_tie?
        return @board.all? { |row| row.all?(String) }
    end

    def check_win?(ps)
        n = get_size()
        target = ps

         # Check rows
        row_match = @board.any? { |row| row.all? { |cell| cell == ps } }

        # Check columns (using transpose)
        col_match = @board.transpose.any? { |col| col.all? { |cell| cell == ps } }

        # Check main diagonal (top-left to bottom-right)
        main_diag = (0...n).all? { |i| @board[i][i] == ps }

        # Check anti-diagonal (top-right to bottom-left)
        anti_diag = (0...n).all? { |i| @board[i][n - 1 - i] == ps }

        return row_match || col_match || main_diag || anti_diag
            
    end
end