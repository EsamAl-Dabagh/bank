require 'account'

describe Account do 

  let(:my_account) { Account.new(50) }
  let(:mockDate) { DateTime.now.strftime("%d/%m/%y") }
  let(:mockDepositAmount) { 65 }
  let(:mockWithdrawAmount) { 33 }
  describe "#new" do
      describe ".statement"
        it "starts as an array with heading titles" do
          expect(my_account.statement).to eq([["Date", "Amount", "Balance"]])
        end
    end

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it "will increase #balance by amount" do 
      expect { my_account.deposit(50) }.to change { my_account.balance }.by (+50) 
    end

    it "will push transaction to @statement" do
      my_account.deposit(mockDepositAmount)
      expect(my_account.statement).to eq([["Date", "Amount", "Balance"],[mockDate, "+£#{mockDepositAmount}", "£#{my_account.balance}"]])
    end

  end

  describe "#withdraw" do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it "will decrease #balance by amount" do 
      expect { my_account.withdraw(10) }.to change { my_account.balance }.by (-10)
    end

    it "will push transaction to @statement" do
      my_account.withdraw(mockWithdrawAmount)
      expect(my_account.statement).to eq([["Date", "Amount", "Balance"],[mockDate, "-£#{mockWithdrawAmount}", "£#{my_account.balance}"]])
    end
  end

  describe "#view_statement" do 
    it "displays recent transactions in a table" do 
      my_account.deposit(500)
      expect(my_account.view_statement).to eq("This is the statement")
    end
  end
end
