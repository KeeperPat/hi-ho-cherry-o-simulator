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
end