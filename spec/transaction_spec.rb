require 'transaction'

describe Transaction do

  describe "#deposit" do
    it 'should return a transa tion hash' do
      assertion = described_class.deposit(5, 0)
      expectation = {:timestamp=>"03/12/2018", :credit=>5, :debit=>0, :balance=>5}
      expect(assertion).to eq expectation
    end
  end

  describe "#withraw" do
    it 'should return a transaction hash' do
      assertion = described_class.withdraw(5, 10)
      expectation = {:timestamp=>"03/12/2018", :credit=>0, :debit=>5, :balance=>5}
      expect(assertion).to eq expectation
    end
  end

end
