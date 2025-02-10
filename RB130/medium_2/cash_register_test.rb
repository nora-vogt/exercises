require 'minitest/autorun'
require 'pry'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'cash_register' # don't need .rb
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100) # starting cash in register
    @transaction = Transaction.new(50) # item cost
    
  end

  def test_accept_money
    @transaction.amount_paid = 50
    @register.accept_money(@transaction)
    assert_equal(150, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 80
    assert_equal(30, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") { @register.give_receipt(@transaction) }
  end


end