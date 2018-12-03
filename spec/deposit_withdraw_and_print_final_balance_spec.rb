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
      tx1 = "01/01/2000 || 0 || 5 || 5\n"
      tx2 = "01/01/2000 || 10 || 0 || 10\n"

      account = Account.new
      account.deposit(10)
      account.withdraw(5)
      expect { account.print }.to output(hd + tx1 + tx2).to_stdout
    end
  end
end
