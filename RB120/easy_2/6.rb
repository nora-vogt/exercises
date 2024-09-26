=begin
# Comparing Wallets

Consider the following broken code. Modify this code so it works. 
Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.

`Wallet` already has a custom `<=>` method defined, and to make it work, we need to create a getter method to access the value of `@amount`, for both the current instance and the instance used for comparison. 

Based on the instructions, the method should be protected, meaning that it can be called by any instance of `Wallet` but only within the class.
=end

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

=begin
Further Exploration

This example is rather contrived and unrealistic, but this type of situation occurs frequently in applications. Can you think of any applications where protected methods would be desirable?

Any scenario where we want to compare information between objects of the same class, but not necessarily give users access to that information. A `JobApplication` class may wish to compare attributes from multiple applicants, but only HR should have access to that data, not the rest of the company.
=end