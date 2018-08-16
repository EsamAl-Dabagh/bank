require 'account'

describe Account do 

  let(:my_account) { Account.new(50) }

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it "should increase #balance by amount" do 
      expect { my_account.deposit(50) }.to change { my_account.balance }.by (+50) 
    end

  end

  describe "#withdraw" do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it "will decrease #balance by amount" do 
      expect { my_account.withdraw(10) }.to change { my_account.balance }.by (-10)
    end
  end

  describe "#view_statement" do 
    it "displays recent transactions in a table" do 
      my_account.deposit(500)
      expect(my_account.view_statement).to eq("This is the statement")
    end
  end
end
