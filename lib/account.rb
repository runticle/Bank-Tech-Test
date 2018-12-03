require_relative 'transaction'
require_relative 'printer'

# Account class
class Account
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0.0
  end

  def deposit(amount)
    @balance += amount
    @transactions << Transaction.new(amount, @balance, 'deposit')
  end

  def withdraw(amount)
    msg = 'You do not have enough money to withdraw this amount'
    raise msg if (@balance - amount) < 0.00

    @balance -= amount
    @transactions << Transaction.new(amount, @balance, 'withdraw')
  end

  def print
    Printer.statement(transactions)
  end
end
