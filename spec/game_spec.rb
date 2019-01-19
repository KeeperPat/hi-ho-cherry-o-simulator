require_relative '../lib/game.rb'

describe Game do
  describe 'after creation' do
    it 'should have four players by default' do
      expect(Game.new.players.size).to be 4
    end

    it 'can have other numbers of players' do
      expect(Game.new(2).players.size).to be 2
    end
  end

  describe 'play' do
    it 'returns the winner' do
      allow(Spinner).to receive(:spin).and_return(:four)
      
      expect(Game.new.play).to be 1
    end

    it 'returns the winner when it is not the first player' do
      allow(Spinner).to receive(:spin).and_return(:one, :one, :four)
      
      expect(Game.new.play).to be 3
    end
  end
end