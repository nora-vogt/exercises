require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(50)
  end

  # Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. 
  def test_prompt_for_payment
    input = StringIO.new("80\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)

    assert_equal 80, @transaction.amount_paid
  end
end