require 'pry'
=begin
# RULES & REQS

  n Place a value n in the "register". Do not modify the stack.
  PUSH Push the register value on to the stack. Leave the value in the register.
  ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
  SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
  MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
  DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
  MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
  POP Remove the topmost item from the stack and place in register
  PRINT Print the register value

  - all operations are integer operations
  - Raise an error if an unexpected item is present in the string
  - Raise an error if attempting to reference a stack value, but the stack is empty
  - In all error cases: no further processing should be performed on the program
  - initailize the register to 0

- Initializing a new Minilang also runs the program
=end

# class Minilang
#   VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

#   def initialize(commands)
#     @stack = []
#     @register = 0
#     @commands = commands.split
#   end

#   def eval
#     @commands.each do |token|
#       raise "Invalid token: #{token}" unless VALID_TOKENS.include?(token) ||  token.to_i.to_s == token
#       if token.to_i.to_s == token
#         @register = token.to_i
#       else
#         send token.downcase
#       end
#     end
#   end

#   def print
#     puts @register
#   end

#   def push
#     @stack << @register
#   end

#   def add
#     @register += @stack.pop
#   end
  
#   def sub
#     @register -= @stack.pop
#   end

#   def mult
#     @register *= @stack.pop
#   end

#   def div
#     @register /= @stack.pop
#   end

#   def mod
#     @register %= @stack.pop
#   end

#   def pop
#     raise "Empty Stack!" if @stack.empty?
#     @register = @stack.pop
#   end
# end


# LS Solution
class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval
    @stack = []
    @register = 0
    @program.split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    @stack.push(@register)
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def add
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)