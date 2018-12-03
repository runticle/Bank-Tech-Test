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
    it 'adds £100 to the account' do
      account.deposit(100)
      expect(account.balance).to eq 100
    end

    it "stores a timestamp of the deposit" do
      account.deposit(100)
      expect(account.transactions[0][:timestamp]).to eq Time.local(2000)
    end
  end

  describe '#withdraw' do
    it 'cannot withdraw to a negative balance' do
      msg = 'You do not have enough money to withdraw this amount'
      expect { account.withdraw(1) }.to raise_error(msg)
    end

    it 'withdraws £100 from the account' do
      account.deposit(200)
      account.withdraw(100)
      expect(account.balance).to eq 100
    end
  end
end
