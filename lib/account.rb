class Account
  def initialize
    @balance = 0
    @transactions = []
  end

  attr_reader :balance, :transactions

  def deposit(amount)
    @balance += amount
    @transactions.push({timestamp: Time.now, credit: amount, debit: 0, balance: @balance})
  end

  def withdraw(amount)
    msg = 'You do not have enough money to withdraw this amount'
    raise msg if (@balance - amount) < 0
    @balance -= amount
    @transactions.push({timestamp: Time.now, credit: 0, debit: amount, balance: @balance})
  end

end
