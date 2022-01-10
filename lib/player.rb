class Player

    attr_accessor :number, :name, :symbol, :moves

    def initialize number, name, symbol
        @number = number
        @name = name
        @symbol = symbol
        @moves = []
    end

end
