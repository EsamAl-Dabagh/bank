require 'printer'

class Account 
  include Printer

  attr_reader :balance

  def initialize(starting_balance = 0)
    @balance = starting_balance
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