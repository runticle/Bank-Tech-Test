class Account
  def initialize
    @balance = 0
  end

  attr_reader :balance

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    msg = 'You do not have enough money to withdraw this amount'
    raise msg if (@balance - amount) < 0

    @balance -= amount
  end
end
