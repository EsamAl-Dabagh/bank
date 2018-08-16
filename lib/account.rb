require 'printer'

class Account 
  include Printer

  attr_reader :balance, :statement

  def initialize(starting_balance = 0)
    @balance = starting_balance
    @statement = [["Date", "Amount", "Balance"]]
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def view_statement
    print_statement("This is the statement")
  end

end