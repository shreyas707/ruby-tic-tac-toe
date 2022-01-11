require_relative '../lib/tic_tac_toe'

RSpec.describe 'TicTacToe' do

    let(:empty_grid) { Array.new(9, " ") }
    let(:tic_tac_toe) { TicTacToe.new }
    
    describe 'print_grid' do
        it "prints the grid" do
            tic_tac_toe.instance_variable_set(:@grid, empty_grid)
            expect{ tic_tac_toe.send(:print_grid) }.to output(
%{
   |   |   
-----------
   |   |   
-----------
   |   |   

}
            ).to_stdout
        end
    end

    describe 'valid_move?' do
        it 'returns true if move is valid (between 1 and 9) and grid is empty' do
            grid = ["X", "O", " ", " ", " ", " ", " ", " ", " "]
            tic_tac_toe.instance_variable_set(:@grid, grid)
            
            expect(tic_tac_toe.send(:valid_move?, 10)).to eq(false)
            expect(tic_tac_toe.send(:valid_move?, 1)).to eq(false)
            expect(tic_tac_toe.send(:valid_move?, 3)).to eq(true)
        end
    end

    describe 'sorted_moves' do
        it "returns an array of indices of the player's moves on the grid" do
            grid = ["X", " ", "X", "O", "O", "X", " ", " ", " "]
            tic_tac_toe.instance_variable_set(:@grid, grid)
            player_1 = Player.new(1, 'Shreyas', 'X')
            expect(tic_tac_toe.send(:sorted_moves, player_1)).to eq([0, 2, 5])
        end
    end

    describe 'game_won?' do
        it 'returns true if the player has won' do
            win_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
            win_grid = ["X", "X", "X", "O", "O", " ", " ", " ", " "]
            tic_tac_toe.instance_variable_set(:@grid, win_grid)
            player_1 = Player.new(1, 'Shreyas', 'X')
            player_2 = Player.new(2, 'Karthik', 'O')

            expect(tic_tac_toe.send(:game_won?, player_1)).to eq(true)
            expect(tic_tac_toe.send(:game_won?, player_2)).to eq(false)
        end
    end
    
    describe 'game_draw?' do
        it 'returns true if the grid does not have an empty slot' do
            draw_grid = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
            on_going_game_grid = ["X", "O", "X", "O", " ", "X", "O", "X", "O"]

            tic_tac_toe.instance_variable_set(:@grid, draw_grid)
            expect(tic_tac_toe.send(:game_draw?)).to eq(true)

            tic_tac_toe.instance_variable_set(:@grid, on_going_game_grid)
            expect(tic_tac_toe.send(:game_draw?)).to eq(false)
        end
    end
    
end
