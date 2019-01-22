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

  describe 'intermediate_results' do
    it 'returns hash with intermediate results sampled at log scale' do
      allow(Spinner).to receive(:spin).and_return(
        :one, 
        :one, 
        :one, 
        :one, 
        :four
      )

      @simulation = Simulation.new
      @simulation.run

      expect(@simulation.intermediate_results).to eq(
        :scale => [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000],
        1 => [0.9, 0.95, 0.9666666666666667, 0.975, 0.98, 0.9833333333333333, 0.9857142857142858, 0.9875, 0.9888888888888889, 0.99, 0.995, 0.9966666666666667, 0.9975, 0.998, 0.9983333333333333, 0.9985714285714286, 0.99875, 0.9988888888888889, 0.999],
        2 => [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        3 => [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        4 => [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
      )
    end
  end
end