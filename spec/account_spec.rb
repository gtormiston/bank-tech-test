require_relative '../account'
require 'date_helper'

describe Account do

  let(:account) { described_class.new }
  let(:printer) { Printer.new }
  let(:todays_date) { get_current_date }

  describe '#new' do
    it 'should have a balance of zero' do
      expect(account.balance).to eq(0)
    end

    it 'should have an empty statement' do
      expect(account.statement).to eq([])
    end
  end


  describe '#deposit' do
    it 'should allow a deposit of an integer' do
      expect{account.deposit(10)}.to change{account.balance}.by(10)
    end

    it 'should allow a deposit of a float' do
      expect{account.deposit(0.55)}.to change{account.balance}.by(0.55)
    end

    it 'should record the date of a deposit' do
      account.deposit(10)
      expect(account.statement.last).to include(:date => todays_date)
    end

    it 'should add a statement line' do
      account.deposit(500.50)
      expect(account.statement.last[:debit]).to eq(nil)
      expect(account.statement.last[:credit]).to eq(500.50)
    end
  end


  describe '#withdraw' do
    it 'should allow a withdrawal of an integer' do
      expect{account.withdraw(10)}.to change{account.balance}.by(-10)
    end

    it 'should allow a withdrawal of a float' do
      expect{account.withdraw(20.20)}.to change{account.balance}.by(-20.20)
    end

    it 'should record the date of a withdrawal' do
      account.withdraw(85)
      expect(account.statement.last).to include(:date => todays_date)
    end

    it 'should add a statement line' do
      account.withdraw(50)
      expect(account.statement.last[:debit]).to eq(50)
      expect(account.statement.last).to include(:credit => nil)
    end
  end


  describe '#balance' do
    it 'should be recorded at the time of a deposit' do
      account.deposit(15)
      expect(account.statement.last[:balance]).to eq(15)
    end

    it 'should be recorded at the time of a withdrawal' do
      account.withdraw(32)
      expect(account.statement.last[:balance]).to eq(-32)
    end
  end


end
