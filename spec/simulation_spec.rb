require_relative '../lib/simulation.rb'

describe Simulation do
  describe 'run' do
    it 'a hash of the winners' do
      allow(Spinner).to receive(:spin).and_return(:one, :four)

      expect(Simulation.new.run).to eq(
        1 => 999,
        2 => 1,
        3 => 0,
        4 => 0
      )
    end
  end

  describe 'stats' do
    before(:each) do
      allow(Spinner).to receive(:spin).and_return(
        :one, 
        :one, 
        :one, 
        :one, 
        :four
)

      @simulation = Simulation.new
      @simulation.run
    end

    it 'returns minimum game length in moves' do
      expect(@simulation.stats[:minimum_game_length]).to be 3
    end

    it 'returns maximum game length in moves' do
      expect(@simulation.stats[:maximum_game_length]).to be 4
    end

    it 'returns average game length in moves' do
      expect(@simulation.stats[:average_game_length]).to be 3.001
    end
  end
end