# Transaction class
class Transaction
  attr_reader :balance, :debit, :credit, :timestamp, :amount

  def initialize(amount, balance, type, time = Time.now.strftime('%d/%m/%Y'))
    @amount = amount
    @balance = balance
    @timestamp = time
    @credit = get_credit(type)
    @debit = get_debit(type)
  end

  def get_credit(type)
    return 0.0 if type == 'withdraw'

    @amount
  end

  def get_debit(type)
    return 0.0 if type == 'deposit'

    @amount
  end
end
