require_relative 'transaction'
require_relative 'printer'

# Account class
class Account
  attr_reader :transactions

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def balance
    return 0.00 if @transactions.empty?

    @transactions.last[:balance]
  end

  def deposit(amount)
    @transactions << Transaction.deposit(amount, balance)
  end

  def withdraw(amount)
    msg = 'You do not have enough money to withdraw this amount'
    raise msg if (balance - amount) < 0.00

    @transactions << Transaction.withdraw(amount, balance)
  end

  def print
    Printer.statement(transactions)
  end
end
