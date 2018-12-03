require 'statement'

describe Statement do
  let(:statement) { described_class.new }

  let(:transaction) do
    double(timestamp: Time.now.strftime('%d/%m/%Y'),
           credit: 100.0, debit: 0.0, balance: 100.0)
  end

  it 'should store transactions' do
    statement.add(transaction)
    expect(statement.transactions.length).to eq 1
  end

  it 'should return a list of transactions' do
    10.times { statement.add(transaction) }
    expect(statement.transactions.length).to eq 10
  end
end
