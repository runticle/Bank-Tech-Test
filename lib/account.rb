require_relative 'transaction'

# Account class
class Account
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def balance
    return 0 if @transactions.length == 0
    @transactions.last[:balance]
  end

  def deposit(amount)
    @transactions << Transaction.deposit(amount, balance)
  end

  def withdraw(amount)
    msg = 'You do not have enough money to withdraw this amount'
    raise msg if (balance - amount) < 0
    @transactions << Transaction.withdraw(amount, balance)
  end

  def print
    puts 'Date || Credit || Debit || Balance'
    @transactions.reverse_each do |tx|
      timestamp = tx[:timestamp]
      credit = tx[:credit]
      debit = tx[:debit]
      balance = tx[:balance]
      puts "#{timestamp} || #{credit} || #{debit} || #{balance}"
    end
  end
end
