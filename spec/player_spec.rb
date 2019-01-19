require_relative '../lib/player.rb'

describe Player do
  let(:player) { Player.new() }

  describe 'after creation' do
    it 'should start with 10 cherries in the tree' do
      expect(player.cherries_in_tree).to eq 10
    end

    it 'should start with 0 cherries on in the basket' do
      expect(player.cherries_in_basket).to eq 0
    end
  end

  describe 'play_turn' do
    describe 'when player draws a number' do
      it 'reduces cherries in tree by that count' do 
        allow(Spinner).to receive(:spin).and_return(:two)

        player.play_turn

        expect(player.cherries_in_tree).to eq 8
      end

      it 'will allow cherries_in_tree to become negative' do
        allow(Spinner).to receive(:spin).and_return(:four)

        3.times{player.play_turn}

        expect(player.cherries_in_tree).to eq 0
      end
    end

    describe 'when player draws a dog' do
      it 'does nothing if player has no cherries' do 
        allow(Spinner).to receive(:spin).and_return(:dog)
        expect(player.cherries_in_basket).to eq 0

        player.play_turn

        expect(player.cherries_in_tree).to eq 10
      end

      it 'puts one back if player has one cherry' do 
        allow(Spinner).to receive(:spin).and_return(:one, :dog)

        player.play_turn
        expect(player.cherries_in_basket).to eq 1

        player.play_turn
        expect(player.cherries_in_basket).to eq 0
      end

      it 'puts one back if player has two or more cherry' do 
        allow(Spinner).to receive(:spin).and_return(:four, :dog)

        player.play_turn
        expect(player.cherries_in_basket).to eq 4

        player.play_turn
        expect(player.cherries_in_basket).to eq 2
      end
    end


    describe 'when player draws a bird' do
      it 'does nothing if player has no cherries' do 
        allow(Spinner).to receive(:spin).and_return(:bird)
        expect(player.cherries_in_basket).to eq 0

        player.play_turn

        expect(player.cherries_in_tree).to eq 10
      end

      it 'puts one back if player has one cherry' do 
        allow(Spinner).to receive(:spin).and_return(:one, :bird)

        player.play_turn
        expect(player.cherries_in_basket).to eq 1

        player.play_turn
        expect(player.cherries_in_basket).to eq 0
      end

      it 'puts one back if player has two or more cherry' do 
        allow(Spinner).to receive(:spin).and_return(:four, :bird)

        player.play_turn
        expect(player.cherries_in_basket).to eq 4

        player.play_turn
        expect(player.cherries_in_basket).to eq 2
      end
    end

    describe 'when player draws a spilled baske' do
      it 'puts everything back' do 
        allow(Spinner).to receive(:spin).and_return(:four, :spilled_basket)

        player.play_turn
        expect(player.cherries_in_basket).to eq 4

        player.play_turn
        expect(player.cherries_in_basket).to eq 0
      end
    end

    describe 'winner?'
      it "returns false when there are cherries in the tree" do
        allow(Spinner).to receive(:spin).and_return(:four)

        2.times{player.play_turn}

        expect(player.winner?).to be false
      end

      it "returns true when there are no cherries in the tree" do
        allow(Spinner).to receive(:spin).and_return(:four)

        3.times{player.play_turn}

        expect(player.winner?).to be true
      end
  end
end