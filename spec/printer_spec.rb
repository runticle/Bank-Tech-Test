require 'printer'

describe Printer do
  before do
    Timecop.freeze(Time.local(2000))
  end

  after do
    Timecop.return
  end

  let(:tx_1) do
    [{ timestamp: Time.now, credit: 100, debit: 0, balance: 100 }]
  end
  let(:tx_2) do
    [{ timestamp: Time.now, credit: 100, debit: 0, balance: 100 },
     { timestamp: Time.now, credit: 0, debit: 50, balance: 50 }]
  end

  describe '#statement' do
    it 'prints the transactions in the desired format' do
      hd = 'Date || Credit || Debit || Balance'
      tx = "01/01/2000 || 100 || 0 || 100\n"
      expect { described_class.statement(tx_1) }.to output(hd + "\n" + tx).to_stdout
    end

    it 'prints the transactions in reverse order' do
      hd = 'Date || Credit || Debit || Balance'
      tx = "01/01/2000 || 0 || 50 || 50\n01/01/2000 || 100 || 0 || 100\n"
      expect { described_class.statement(tx_2) }.to output(hd + "\n" + tx).to_stdout
    end
  end
end
