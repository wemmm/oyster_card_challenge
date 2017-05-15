require 'oystercard'

describe Oystercard do

  # Maximum Oystercard balance amount
  MAXIMUM_BALANCE = 90

  subject(:card) { Oystercard.new }

  it { is_expected.to respond_to(:top_up).with(1).argument }
  it { is_expected.to respond_to(:maximum_balance) }
  it { is_expected.to respond_to(:touch_in) }
  it { is_expected.to respond_to(:in_journey) }

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

  describe '#touch_in' do
    it 'sets an instance variable, @in_journey to true' do
      card.touch_in
      expect(card.in_journey).to eq true
    end
  end

  describe '#in_journey?' do
    it 'returns true or false depending on whether a card is on a journey or not' do
      expect(card.in_journey?).to be(true).or be(false)
    end
  end

end
