class Oystercard

  attr_reader :balance, :maximum_balance

  def initialize
    @balance = 0
    @maximum_balance = 90
  end

  def top_up(amount)
    raise "Your new balance would exceed the maximum balance" if @balance + amount > @maximum_balance
    @balance += amount
  end

end
