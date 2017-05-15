require 'oystercard'

describe Oystercard do

  subject(:card) { Oystercard.new }

  describe '#balance' do
    it 'returns the balance' do
      expect(card.balance).to eq 0
    end
  end

end
