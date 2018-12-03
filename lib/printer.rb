# Printer class
class Printer
  def self.print(transactions)
    puts 'Date || Credit || Debit || Balance'
    transactions.reverse_each do |tx|
      puts "#{tx.timestamp} || #{tx.credit} || #{tx.debit} || #{tx.balance}"
    end
  end
end
