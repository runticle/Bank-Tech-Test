require 'account'
require 'timecop'

describe Account do
  let(:statement) { double(:statement, add: true) }
  let(:printer) { double(:printer, statement: true) }
  let(:transaction) { double(:transaction, new: true) }
  let(:account) { described_class.new(statement, printer, transaction) }

  describe '#balance' do
    it 'starts with 0 balance' do
      expect(account.balance).to eq 0.00
    end
  end

  describe '#deposit' do
    it 'adds to the balance' do
      account.deposit(100.0)
      expect(account.balance).to eq 100.0
    end
  end

  describe '#withdraw' do
    it 'cannot withdraw to a negative balance' do
      msg = 'You do not have enough money to withdraw this amount'
      expect { account.withdraw(1.00) }.to raise_error(msg)
    end

    it 'should reduce the balance appropriately' do
      account.deposit(200.00)
      account.withdraw(100.00)
      expect(account.balance).to eq 100.0
    end
  end

  describe '#print' do
    it 'requests a printout from Print class' do
      expect(printer).to receive(:print)
      expect(statement).to receive(:transactions)
      account.print
    end
  end
end
