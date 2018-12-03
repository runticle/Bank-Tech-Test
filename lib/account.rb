require_relative 'transaction'
require_relative 'printer'
require_relative 'statement'

# Account class
class Account
  attr_reader :balance

  def initialize
    @statement = Statement.new
    @balance = 0.0
  end

  def deposit(amount)
    @balance += amount
    @statement.add(Transaction.new(amount, @balance, 'deposit'))
  end

  def withdraw(amount)
    msg = 'You do not have enough money to withdraw this amount'
    raise msg if (@balance - amount) < 0.00

    @balance -= amount
    @statement.add(Transaction.new(amount, @balance, 'withdraw'))
  end

  def print
    Printer.statement(@statement.transactions)
  end
end
