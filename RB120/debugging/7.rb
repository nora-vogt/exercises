require 'pry'
class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0 && valid_transaction?(balance - amount)
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50

=begin
#Bank Balance
We created a simple BankAccount class with overdraft protection, that does not allow a withdrawal greater than the amount of the current balance. We wrote some example code to test our program. However, we are surprised by what we see when we test its behavior. 

Why are we seeing this unexpected output? 
The #withdraw method is responsible for the unexpected output. Currently, the `if` statemennt only checks if the `amount` of the withdrawal is greater than zero in order to execute the withdrawal. The code does not check if the account has a sufficient balance to cover the withdrawal.

Additionally, the balance is not being updated. This is because the `#balance=` setter method `if` statement invokes `valid_transaction?` to check if the transaction is valid. `valid_transaction?` takes a `new_balance` argument, and returns `true` if the `new_balance` is greater than zero, `false` otherwise.

However, with how the code is currently written, attempting to withdraw `80` from an account with a balance of `50`, the `withdraw` method will calculate `self.balance -= amount`, which returns `-30` in this case. That value will be passed in to the `balance=` method, and `valid_transaction?` will return false, because `-30` is not greater than zero. This value gets assigned to `success`. Because `-30` is an `Integer`, and integers are truthy, the `if` branch of the `if` statement on line 28 executes, returning the successful withdrawl string.

### How does `-30` get assigned to `success`, rather than `false`?
ANSWER: In Ruby, setter methods ALWAYS return the argument that was passed in, even when you add an explicit `return`, and even if no assignment of the instance variable actually takes place.

To fix this, we need to validate that there is enough available in the account to fully cover the withdrawal.

Make changes to the code so that we see the appropriate behavior.

Further Exploration

What will the return value of a setter method be if you mutate its argument in the method body?
=end