class Oystercard

  attr_reader :balance, :maximum_balance

  def initialize
    @balance = 0
    @maximum_balance = 90
  end

  def top_up(amount)
    raise "New balance would exceed £#{@maximum_balance} maximum" if @balance + amount > @maximum_balance
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
