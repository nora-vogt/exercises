=begin
A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

    n Place a value n in the "register". Do not modify the stack.
    PUSH Push the register value on to the stack. Leave the value in the register.
    ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    POP Remove the topmost item from the stack and place in register
    PRINT Print the register value

All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.

RULES:
- Register is the current value
- Register is not part of the stack
- Register is initialized to 0
- Stack is an array - add/delete with push/pop
- All operations are integer oeprations
- Input programs will be a string
  - all operations in string will be valid

To perform a 2-element operation
  - pop last value from stack
  - calculate with register value
  - reassign register value to the result

Examples:

minilang('PRINT')
# 0
Register: 0
Stack: []
print the register => 0

minilang('5 PUSH 3 MULT PRINT')
# 15
Register 0:
Stack: []

command: 5
Register: 5
Stack: []

command: PUSH
Register: 5
Stack: [5]

command: 3
Register: 3
Stack: [5]

command: MULT
Register: 15
Stack: []

command: PRINT
Register: 15
Stack: []
=> 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

DATA STRUCTURES:
Input: String of program commands (each command separated by whitespace)

Register: integer (init to 0)
Stack: empty array []

array of program commands 

Output: a printed value

ALGORITHM:
Given a string representing program commands, "program"
- SET register to 0
- SET stack to an empty array
- split the program string into an array of strings
  - split on whitespace
  - SET to commands

- iterate through the array of commands
  - for each action
  - use a case statement - check if the command is equal to a value of the valid commands
    - if so, execute that command

  commands:
    n Place a value n in the "register". Do not modify the stack.
      - check if command is equal to command.to_i.to_s
      - if true, set register to the integer version of command
    PUSH Push the register value on to the stack. Leave the value in the register.
    ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    POP Remove the topmost item from the stack and place in register
    PRINT Print the register value
=end

def minilang1(program)
  register = 0
  stack = []
  commands = program.split

  commands.each do |command|
    case command
    when command.to_i.to_s then register = command.to_i
    when 'PUSH'            then stack << register
    when 'ADD'             then register += stack.pop
    when 'SUB'             then register -= stack.pop
    when 'MULT'            then register *= stack.pop
    when 'DIV'             then register /= stack.pop
    when 'MOD'             then register %= stack.pop
    when 'POP'             then register = stack.pop
    when 'PRINT'           then puts register
    end
  end
end


# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT') 
# 15

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

#minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# LS Solution
  # The same except for handling a command of 'n' as the 'else' condition

def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end

  p register
  p stack
end

=begin
Further Exploration
Try writing a minilang program to evaluate and print the result of this expression:

(3 + (4 * 5) - 7) / (5 % 3)

work from the end to the beginning
  - computer right side, store in stack
  - store each number in left side in stack, in reverse operation order
   - 7, 3, 5
  - register is the 'working number' where results of operation are temporarily stored

register: 0
stack: []

3 PUSH 5 MOD
register: 2
stack: []

PUSH
register: 2
stack: [2]

7
register: 7
stack: [2]

PUSH
register: 7
stack: [2, 7]

3
register: 3
stack: [2, 7]

PUSH:
register: 3
stack: [2, 7, 3]

5
register: 5
stack: [2, 7, 3]

PUSH
register: 5
stack: [2, 7, 3]

4
register: 4
stack: [2, 7, 3, 5]

MULT
register: 20
stack: 2, 7, 3

ADD
register: 23
stack: 2, 7

SUB
register: 16
stack: 2

DIV
register: 8
stack: []

PRINT

(3 + 20 - 7)
(23 - 7)
16 / (5 % 3)
16 / 2
8

The answer should be 8. This is trickier than it sounds! 
=end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 5 PUSH 4 MULT ADD SUB DIV PRINT')