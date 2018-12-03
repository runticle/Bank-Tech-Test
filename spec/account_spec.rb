require 'account'
require 'timecop'

describe Account do
  let(:account) { described_class.new }

  before do
    Timecop.freeze(Time.local(2000))
  end

  after do
    Timecop.return
  end

  describe '#balance' do
    it 'starts with 0 balance' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'adds a trasaction hash to the tx array' do
      account.deposit(100)
      expect(account.transactions.length).to eq 1
    end
  end

  describe '#withdraw' do
    it 'cannot withdraw to a negative balance' do
      msg = 'You do not have enough money to withdraw this amount'
      expect { account.withdraw(1) }.to raise_error(msg)
    end

    it 'adds a trasaction hash to the tx array' do
      account.deposit(200)
      account.withdraw(100)
      expect(account.transactions.length).to eq 2
    end
  end

  describe '#print' do
    it 'has a store of all transactions' do
      10.times { account.deposit(10) }
      expect(account.transactions.length).to eq 10
    end

    it 'prints the transactions in the desired format' do
      heading = 'Date || Credit || Debit || Balance'
      tx = "01/01/2000 || 100 || 0 || 100\n"
      account.deposit(100)
      expect { account.print }.to output(heading + "\n" + tx).to_stdout
    end

    it 'prints the transactions in reverse order' do
      heading = 'Date || Credit || Debit || Balance'
      tx = "01/01/2000 || 0 || 50 || 50\n01/01/2000 || 100 || 0 || 100\n"
      account.deposit(100)
      account.withdraw(50)
      expect { account.print }.to output(heading + "\n" + tx).to_stdout
    end
  end
end
