require 'account'

describe Account do 

  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }

    it "should increase #balance by amount" do 
      expect { subject.deposit(50) }.to change { subject.balance }.by (+50) 
    end

  end

  describe "#withdraw" do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it "will decrease #balance by amount" do 
      expect { subject.withdraw(10) }.to change { subject.balance }.by (-10)
    end
  end

  describe "#view_statement" do 
    
  end
end

