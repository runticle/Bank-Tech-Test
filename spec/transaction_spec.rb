require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new(100.0, 100.0, 'deposit') }

  describe '#create' do
    it 'should build a new transaction' do
      tx = Transaction.create(100.0, 100.0, 'deposit')
      expect(tx.balance).to eq transaction.balance
    end
  end

  describe '#new' do
    it 'should have a current balance' do
      expect(transaction.balance).to eq 100.0
    end

    it 'should have a credit amount' do
      expect(transaction.credit).to eq 100.0
    end

    it 'should have a debit amount' do
      expect(transaction.debit).to eq 0.0
    end
  end
end
