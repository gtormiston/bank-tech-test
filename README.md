# Bank Tech Test

### User Interface

To create a new account:
```ruby
account = Account.new
#=> creates a new instance of the Account class with an empty statement and zero balance
```

To deposit an amount:
```ruby
account.deposit(10)
#=> adds 10 to the balance, inserts a new line in the account statement
```

To withdraw an amount:
```ruby
account.withdraw(15)
#=> removes 10 from the balance, inserts a new line in the account statement
```

To print an account statement:
```ruby
Printer.print_statement(account.statement)
#=> prints all lines in the account statement to the user
```

You can also preview the balance at any time:
```ruby
account.balance
```

### User stories

```text
As a bank account holder
So I can store money in my account
I want to be able to make deposits
```

```text
As a bank account holder
So I can take money from my account
I want to be able to make withdrawals
```

```text
As a bank account holder
So I know how the status of my account
I want to be able to print a statement
```

### Functionality

The statement is recorded as an array of hashes:
```ruby
[{date: date, credit: amount, debit: amount, balance: amount}]
```

On initialisation this is empty, but each `deposit` or `withdraw` action inserts a new line, with the current date and balance (at time of running the method).

A helper class, `Datehelper` provides a method, `get_current` to insert the current date in the desired format.
