require 'printer'

describe Printer do
  before do
    Timecop.freeze(Time.local(2000))
  end

  after do
    Timecop.return
  end

  let(:tx_1) do
    [{ timestamp: Time.now.strftime('%d/%m/%Y'),
       credit: 100.0, debit: 0.0, balance: 100.0 }]
  end
  let(:tx_2) do
    [{ timestamp: Time.now.strftime('%d/%m/%Y'),
       credit: 100.0, debit: 0.0, balance: 100.0 },
     { timestamp: Time.now.strftime('%d/%m/%Y'),
       credit: 0.0, debit: 50.0, balance: 50.0 }]
  end

  describe '#statement' do
    it 'prints the transactions in the desired format' do
      hd = 'Date || Credit || Debit || Balance'
      tx = "01/01/2000 || 100.0 || 0.0 || 100.0\n"
      expect { described_class.statement(tx_1) }.to output(hd + "\n" + tx).to_stdout
    end

    it 'prints the transactions in reverse order' do
      hd = 'Date || Credit || Debit || Balance'
      tx = "01/01/2000 || 0.0 || 50.0 || 50.0\n01/01/2000 || 100.0 || 0.0 || 100.0\n"
      expect { described_class.statement(tx_2) }.to output(hd + "\n" + tx).to_stdout
    end
  end
end
