require_relative '../lib/player'

RSpec.describe 'Player' do

    let(:number) { 1 }
    let(:name) { 'Shreyas' }
    let(:symbol) { 'X' }

    it "successfully assigns number, name, symbol and moves to a new player" do
        @player = Player.new(number, name, symbol)
        expect(@player.number).to eq(number)
        expect(@player.name).to eq(name)
        expect(@player.symbol).to eq(symbol)
        expect(@player.moves).to eq([])
    end
end
