require 'account'

describe Account do
  before do
    Timecop.freeze(Time.local(2000))
  end

  after do
    Timecop.return
  end

  describe 'full feature test' do
    it 'should print my final statement correctly' do
      hd = "Date || Credit || Debit || Balance\n"
      tx1 = "01/01/2000 || 0.0 || 5.0 || 5.0\n"
      tx2 = "01/01/2000 || 10.0 || 0.0 || 10.0\n"

      account = Account.new
      account.deposit(10.00)
      account.withdraw(5.00)
      expect { account.print }.to output(hd + tx1 + tx2).to_stdout
    end
  end
end
