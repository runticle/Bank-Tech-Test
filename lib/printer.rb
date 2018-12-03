# Printer class
class Printer
  def self.statement(transactions)
    puts 'Date || Credit || Debit || Balance'
    transactions.reverse_each do |tx|
      timestamp = tx[:timestamp]
      credit = tx[:credit]
      debit = tx[:debit]
      balance = tx[:balance]
      puts "#{timestamp} || #{credit} || #{debit} || #{balance}"
    end
  end
end
