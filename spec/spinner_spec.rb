require_relative '../lib/spinner.rb'

describe Spinner do
  describe 'SECTIONS' do
    it 'has all options from the game' do
      expect(Spinner::SECTIONS.to_s).to eq '[:one, :two, :three, :four, :dog, :bird, :spilled_basket]'
    end
  end

  describe 'spin' do
    it 'returns a value in Spinner::SECTIONS' do
      expect(Spinner::SECTIONS).to include Spinner.spin
    end
  end
end