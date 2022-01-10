class Player

    PLAYER_1_SYMBOL = 'X'
    PLAYER_2_SYMBOL = 'O'

    attr_accessor :number, :name, :symbol, :moves

    def initialize number, name
        @number = number
        @name = name
        @symbol = self.number == 1 ? PLAYER_1_SYMBOL : PLAYER_2_SYMBOL
        @moves = []
    end

end
