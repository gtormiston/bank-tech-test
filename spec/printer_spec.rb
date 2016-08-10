require_relative '../account'
require 'date_helper'

describe Printer do

  let(:account) { Account.new }
  let(:todays_date) { get_current_date }

  describe '#print_statement' do
    it 'should be empty if no deposits or withdrawals made' do
      expect( account.statement).to eq([])
      expect { Printer.print_statement(account.statement) }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'should print a new line for each deposit or withdrawal' do
      account.deposit(10)
      account.withdraw(10)
      expect(account.statement.count).to eq(2)
      expect { Printer.print_statement(account.statement) }.to output("date || credit || debit || balance\n" +
                                                    "#{todays_date} || 10 ||  || 10\n" +
                                                    "#{todays_date} ||  || 10 || 0\n").to_stdout
    end

    it 'should print a blank space in the withdrawal column for a deposit line' do
      account.deposit(15)
      expect { Printer.print_statement(account.statement) }.to output("date || credit || debit || balance\n" +
                                                   "#{todays_date} || 15 ||  || 15\n").to_stdout
    end

    it 'should print a blank space in the deposit column for a withdrawal line' do
      account.withdraw(15)
      expect { Printer.print_statement(account.statement) }.to output("date || credit || debit || balance\n" +
                                                    "#{todays_date} ||  || 15 || -15\n").to_stdout
    end
  end

end
