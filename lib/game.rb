require_relative "./board"
require_relative "./player"

class Game
    attr_reader :in_progress, :player_turn, :game_board

    def initialize()
        create_players()

        @game_board = Board.new
        @player_turn = @player_1
        puts "Player 1" + "#{@player_1.to_h};" + "Player 2" + "#{@player_2.to_h};"
        @in_progress = true
    end

    def create_players
        begin
        print "Enter Player 1's Name: "
        p1n = gets.chomp

        print "Enter Player 1's Symbol: "
        p1s = gets.chomp

        @player_1 = Player.new(p1n, p1s)
        rescue ArgumentError => e
            puts "Bad argument: #{e.message}"
            retry
        end

        begin
        print "Enter Player 2's Name: "
        p2n = gets.chomp

        print "Enter Player 2's Symbol: "
        p2s = gets.chomp

        @player_2 = Player.new(p2n, p2s)
        rescue ArgumentError => e
            puts "Bad argument: #{e.message}"
            retry
        end
    end

    def switch_player
        if @player_turn == @player_1
            @player_turn = @player_2
        else
            @player_turn = @player_1
        end
    end

    def play_game
        while @in_progress
            begin
            puts "#{@player_turn.name} " + "pick a number: "
            @game_board.print_board
            player_move = gets.chomp.to_i
            @game_board.update_board(player_move, @player_turn.symbol)
            rescue ArgumentError => e
                puts "Bad argument: #{e.message}"
            end
            if @game_board.check_win?(@player_turn.symbol)
                @in_progress = false
                puts "#{@player_turn.name} wins"
            elsif @game_board.check_tie?
                @in_progress = false
                puts "It's a tie!"
            end

            switch_player()
        end
    end

end