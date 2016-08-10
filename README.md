# Bank Tech Test

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


## Interface

client_name = Client.new(name)
account_name = Account.new(client)

Account.deposit(amount, date) - should today's date be inferred / automated
Account.withdraw(amount, date)
Account.balance
Account.print_statement - prints all entries


---
Client - understands the client (do we even need another class for the client?)
Account - understands the money in the account
date - input should be standardised


Print output:

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
