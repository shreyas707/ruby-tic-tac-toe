require_relative 'player'

class TicTacToe

    PLAYER_1_SYMBOL = 'X'
    PLAYER_2_SYMBOL = 'O'

    WIN_COMBINATIONS = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7]
    ]

    def initialize
        @grid = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    
    def start_game
        print_grid
        get_players_details
    end
    
    private

    def print_grid
        puts
        puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
        puts "-----------"
        puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
        puts "-----------"
        puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
        puts
    end

    def get_players_details
        print "Enter Player 1 name (symbol '#{PLAYER_1_SYMBOL}'): "
        player_1_name = gets.chomp
        @player_1 = Player.new(1, player_1_name, PLAYER_1_SYMBOL)

        print "Enter Player 2 name (symbol '#{PLAYER_2_SYMBOL}'): "
        player_2_name = gets.chomp
        @player_2 = Player.new(2, player_2_name, PLAYER_2_SYMBOL)

        play_game(@player_1)
    end

    def play_game(current_player)
        if game_draw?
            puts "ITS A DRAW"
            exit
        else
            print "\n#{current_player.name}, enter your move (1-9): "
            move = gets.chomp.to_i

            if valid_move?(move)
                @grid[move-1] = current_player.symbol
                current_player.moves.push(move)
                print_grid
                if game_won?(current_player)
                    puts "GAME WON BY #{current_player.name}"
                    exit
                else
                    play_game(next_player(current_player))
                end
            else
                puts "Wrong Move."
                play_game(current_player)
            end
        end
    end

    def valid_move?(move)
        move.between?(1,9) && @grid[move-1] == " "
    end

    def next_player(current_player)
        current_player.number == 1 ? @player_2 : @player_1
    end

    def game_won?(player)
        WIN_COMBINATIONS.each do |combination|
            return true if (combination & player.moves.sort) == combination
        end
        return false
    end

    def game_draw?
        !@grid.include?(" ")
    end

end
