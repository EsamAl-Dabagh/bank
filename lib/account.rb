require_relative 'printer'
require 'date'

class Account 
  include Printer

  attr_reader :balance, :statement

  def initialize(starting_balance = 0)
    @balance = starting_balance
    @statement = [["Date", "Amount", "Balance"]]
  end

  def deposit(amount)
    date = DateTime.now.strftime("%d/%m/%y")
    @balance += amount
    @statement << [date, "+£#{amount}", "£#{@balance}"]
  end

  def withdraw(amount)
    date = DateTime.now.strftime("%d/%m/%y")
    @balance -= amount
    @statement << [date, "-£#{amount}", "£#{@balance}"]
  end

  def view_statement
    print_statement("This is the statement")
  end

end