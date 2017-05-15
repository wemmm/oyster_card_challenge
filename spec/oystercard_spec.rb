require 'oystercard'

describe Oystercard do

  # Maximum Oystercard balance amount
  MAXIMUM_BALANCE = 90

  subject(:card) { Oystercard.new }

  it { is_expected.to respond_to(:top_up).with(1).argument }
  it { is_expected.to respond_to(:maximum_balance) }
  it { is_expected.to respond_to(:deduct).with(1).argument }

  describe '#balance' do
    it 'returns the balance' do
      expect(card.balance).to eq 0
    end
  end

  describe '#maximum_balance' do
    it 'has a maximum balance defined' do
      expect(card.maximum_balance).to eq MAXIMUM_BALANCE
    end
  end

  describe '#top_up' do
    it 'increases the balance of the card by the specified amount' do
      expect { card.top_up 10 }.to change { card.balance }.by 10
    end

    it 'throws an exception if the new balance exceeds the limit' do
      expect { card.top_up 100 }.to raise_error "New balance would exceed £#{MAXIMUM_BALANCE} maximum"
    end
  end

  describe '#deduct' do
    it 'decreases the balance with the specified amount' do
      card.top_up 10
      expect { card.deduct 5 }.to change { card.balance }.by -5
    end
  end

end
