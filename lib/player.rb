class Player
    # tracks symbols in use
    @@player_symbols = []

    attr_reader :symbol
    attr_accessor :name

    def initialize(n, s)
        @name = n
        if @@player_symbols.include?(s)
            raise ArgumentError, "Symbol already in use by another player"
        elsif s.strip == ""
            raise ArgumentError, "Please provide an actual value"
        
        end
        @symbol = s 
        @@player_symbols << s
    end
end