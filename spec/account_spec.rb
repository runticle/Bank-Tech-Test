require 'account'
require 'timecop'

describe Account do
  let(:account) { described_class.new }

  describe '#balance' do
    it 'starts with 0 balance' do
      expect(account.balance).to eq 0.00
    end
  end

  describe '#deposit' do
    it 'adds a trasaction instance to the transaction array' do
      account.deposit(100.00)
      expect(account.transactions.length).to eq 1
    end
  end

  describe '#withdraw' do
    it 'cannot withdraw to a negative balance' do
      msg = 'You do not have enough money to withdraw this amount'
      expect { account.withdraw(1.00) }.to raise_error(msg)
    end

    it 'adds a trasaction instance to the transaction array' do
      account.deposit(200.00)
      account.withdraw(100.00)
      expect(account.transactions.length).to eq 2
    end
  end

  describe '#print' do
    it 'has a store of all transactions' do
      10.times { account.deposit(10.00) }
      expect(account.transactions.length).to eq 10
    end

    it 'responds to print' do
      expect(account).to respond_to(:print)
    end
  end
end
