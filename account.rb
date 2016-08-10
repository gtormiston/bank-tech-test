# understands the status of an account
require_relative 'printer'
require_relative 'datehelper'

class Account

  def initialize
    @balance = INITIAL_BALANCE
    @statement = []
  end

  attr_reader :balance, :statement

  def deposit(amount)
    add_to_statement(Datehelper.get_current, amount, nil, @balance += amount)
  end

  def withdraw(amount)
    add_to_statement(Datehelper.get_current, nil, amount, @balance -= amount)
  end

  private

  INITIAL_BALANCE = 0

  def add_to_statement(date, credit, debit, balance)
    statement_line = {date: date, credit: credit, debit: debit, balance: balance}
    @statement.unshift(statement_line)
  end

end
