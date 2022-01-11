require_relative 'player'
require 'pry'

class TicTacToe

    PLAYER_1_SYMBOL = 'X'
    PLAYER_2_SYMBOL = 'O'

    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

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
                print_grid
                if game_won?(current_player)
                    puts "#{current_player.name} WON THE GAME"
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
        WIN_COMBINATIONS.each do |win_combination|
            return true if (win_combination & sorted_moves(player)) == win_combination
        end
        return false
    end

    def sorted_moves(player)
        @grid.each_index.select { |i| @grid[i] == player.symbol }
    end

    def game_draw?
        !@grid.include?(" ")
    end

end
