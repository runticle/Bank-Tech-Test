require_relative 'transaction'
require_relative 'printer'
require_relative 'statement'

# Account class
class Account
  attr_reader :balance, :printer

  def initialize(statement = Statement.new, printer = Printer, transaction = Transaction)
    @statement = statement
    @balance = 0.0
    @printer = printer
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    @statement.add(@transaction.new(amount, @balance, 'deposit'))
  end

  def withdraw(amount)
    msg = 'You do not have enough money to withdraw this amount'
    raise msg if (@balance - amount) < 0.00

    @balance -= amount
    @statement.add(@transaction.new(amount, @balance, 'withdraw'))
  end

  def print
    @printer.statement(@statement.transactions)
  end
end
