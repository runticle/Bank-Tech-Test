class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    add_deposit_to_tx(amount)
  end

  def withdraw(amount)
    msg = 'You do not have enough money to withdraw this amount'
    raise msg if (@balance - amount) < 0
    @balance -= amount
    add_withdraw_to_tx(amount)
  end


  private

  def add_deposit_to_tx(amount)
    @transactions.push({timestamp: Time.now, credit: amount, debit: 0, balance: @balance})
  end

  def add_withdraw_to_tx(amount)
    @transactions.push({timestamp: Time.now, credit: 0, debit: amount, balance: @balance})
  end

end
