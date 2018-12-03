describe 'Account' do
  before do
    account = described_class.new
  end

  it 'starts with 0 balance' do
    expect(account.balance).to_equal 0
  end

  describe 'deposits' do
    it 'adds £100 to the account' do
      account.deposit(100)
      expect(account.balance).to_equal 100
    end
  end

  describe 'withdrawals' do
    it 'cannot withdraw to a negative balance' do
      msg = 'You do not have enough money to withdraw this amount'
      expect(account.withdraw(1)).to raise_error(msg)
    end

    it 'withdraws £100 from the account' do
      account.deposit(200)
      account.withdraw(100)
      expect(account.balance).to_equal 100
    end
  end
end
