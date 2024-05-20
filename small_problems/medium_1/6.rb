=begin
# A stack is a list of values that grows and shrinks dynamically. 

Ruby: array - #push, #pop

stack-and-register: each operaion uses a register (current token). register is not part of the stack.
- two values required: language uses the register + pops the topmost item from the stack

MULT operation example:
- multiples stack token * register token, removes stack token from stack, stores the result in the register. 

stack:
4 (top)
6
3

register: 7

MULT transforms
stack:
6 (top)
3

register: 28 (7 * 4)

PROBLEM:
Write a method that implements a mini stack-and-register-based programming language. It will have the following commands:

Needed Commands:
- n Place a token n in the "register". Do not modify the stack.
- PUSH Push the register token on to the stack. Leave the token in the register.
- ADD Pops a token from the stack and adds it to the register token, storing the result in the register.
- SUB Pops a token from the stack and subtracts it from the register token, storing the result in the register.
- MULT Pops a token from the stack and multiplies it by the register token, storing the result in the register.
- DIV Pops a token from the stack and divides it into the register token, storing the integer result in the register.
- MOD Pops a token from the stack and divides it into the register token, storing the integer remainder of the division in the register.
- POP Remove the topmost item from the stack and place in register
- PRINT Print the register token

Input:
- string (token + program command)

Output:
- integer (result of program)

Rules:
- all operations are integer operations
- all given input programs are correct programs
- initialize the register to zero
- programs are uppercase in string
- string contains integer values and uppercase program commands
- integer before command becomes register token
- some commands do not have a leading integer (i. e. PUSH)

EXAMPLES:

program: PRINT - prints the register token
stack: []
register: 0
=> prints 0


---
5 PUSH - push register token to stack + leave token in register
3 MULT
PRINT

stack: []
register: 0

5 PUSH =>
stack: [5]
register: 5

3 MULT =>
stack: [5]
register: 3
(pop) []
5 * 3 = 15

register: 15

5 PRINT 
stack: []
register: 5
(prints 5)

PUSH 
stack: [5]
register: 5

3 PRINT
stack: [5]
register: 3
(prints 3)

ADD 
stack: []
register: 8 (5 + 3)

PRINT
stack: []
register: 8
(prints 8)


DATA STRUCTURES:
stack is an array []
register is initialized to 0

parse commands from strings - split into array on whitespace [5, push, 3, ...]


ALGORITHM:
given a string, "programs"
- SET register to 0
- SET stack to empty aray
- SET "program_data" to empty array
- split the string into an array of programs, split on whitespace, assign to program_data
- iterate through program data
  - check if current element is an integer
    - if true: reassign register to current element
    - if false:
      - execute command associated with string
      - (case statement of all commands)
=end

def minilang(programs)
  register = 0
  stack = []
  program_data = programs.split
  program_data.each do |token|
      case token   
      when 'PUSH'  then stack << register
      when 'ADD'   then register += stack.pop
      when 'SUB'   then register -= stack.pop
      when 'MULT'  then register *= stack.pop
      when 'DIV'   then register /= stack.pop
      when 'MOD'   then register = register % stack.pop
      when 'POP'   then register = stack.pop
      when 'PRINT' then puts register
      else              register = token.to_i
      end
  end
  p "register is #{register}"
  p "stack is #{stack}"
end

# Further Exploration
  # Have method detect empty stack conditions
  # empty tokens in the program
  # report those
  # method should return an error message if an error occurs, and nil if the program runs successfully

# Refactored by removing initial if statement, making it the 'else' in the case statement
  # Renamed block parameter from "value" to "token" - a token is a word or token in a language


# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

# TIME: 31:34

# Further Exploration
# (3 + (4 * 5) - 7) / (5 % 3)

# 5 % 3 = 2 (register)
# PUSH (register 2; stack 2)
# 7 PUSH (register 2; stack 7)
# 4 PUSH (register 4; stack 2, 7)
# 5 MULT (register 20; stack 2, 7)
# PUSH (register: 0; stack: 2, 7, 20)
# 3 ADD (register: 23; stack: 2, 7)
# SUB (register: 16; stack 2)
# DIV 
# operations are
# register - stack; register / stack, register * stack etc
# second half first

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
# 8