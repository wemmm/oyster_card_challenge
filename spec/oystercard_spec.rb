require 'oystercard'

describe Oystercard do

  subject(:card) { Oystercard.new }

  describe '#balance' do
    it 'returns the balance' do
      expect(card.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'increases the balance of the card by the specified amount' do
      card.top_up(100)
      expect(card.balance).to eq 100
    end
  end

end
