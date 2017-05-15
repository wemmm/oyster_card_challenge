class Oystercard

  attr_reader :balance, :maximum_balance, :in_journey

  def initialize
    @balance = 0
    @maximum_balance = 90
    @in_journey = false
  end

  def top_up(amount)
    raise "New balance would exceed £#{@maximum_balance} maximum" if @balance + amount > @maximum_balance
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

end
