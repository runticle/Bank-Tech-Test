# Transaction class
class Transaction
  def self.deposit(amount, balance)
    balance += amount
    { timestamp: Time.now.strftime('%d/%m/%Y'),
      credit: amount, debit: 0.00, balance: balance }
  end

  def self.withdraw(amount, balance)
    balance -= amount
    { timestamp: Time.now.strftime('%d/%m/%Y'),
      credit: 0.00, debit: amount, balance: balance }
  end
end
