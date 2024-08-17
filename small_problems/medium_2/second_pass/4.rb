=begin
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

PROBLEM:
Given a string that may contain parentheses, return true if the parentheses are balanced. A pair is balanced if it begins with an opening parenthesis ( and ends with a closed parenthesis ). There may not be unpaired parentheses, or parentheses in the wrong order

RULES:
- a 'balanced' pair is ( and )
- ( must come first
- parentheses do not have to be consecutive
- a string with no parentheses is balanced


EXAMPLES:
p balanced?('What (is) this?') == true -- 1 pair
  ()


p balanced?('What is) this?') == false -- extra )
p balanced?('What (is this?') == false -- extra (
p balanced?('((What) (is this))?') == true -- pairs may be nested
p balanced?('((What)) (is this))') == false -- next pair starts with )
p balanced?('Hey!') == true -- EDGE CASE - no parentheses

p balanced?(')Hey!(') == false -- EDGE CASE - ) and ( but wrong order
)Hey!(
^
) right away we start with the wrong parenthesis, can return false early


p balanced?('What ((is))) up(') == false -- extra ) and ( in wrong order
p balanced?('What ())(is() up') == false -- )(

DATA STRUCTURES:
  needs:
    - to consider order: ( must come before )
    - to consider pairs: ( must have a )
Input: String (may contain parentheses)

balance counter: start at 0
array of chars

Output: boolean (true if balanced)

ALGORITHM:
Given a string,
- SET balance_counter to 0
- DETERMINE if string is balanced
  - ITERATE through the characters of the string
    - for each character, [character]
    - IF character is (, INCREMENT balance_counter by 1
    - IF character is ), DECREMENT balance_counter by 1
    - RETURN FALSE if balance_counter < 0
- IF balance_counter is zero, return true, otherwise false
=end

def balanced1?(string)
  balance_counter = 0

  string.each_char do |character|
    if character == '('
      balance_counter += 1
    elsif character == ')'
      balance_counter -= 1
    end

    return false if balance_counter < 0
  end

  balance_counter.zero?
end

def balanced2?(string)
  balance_counter = 0

  string.chars.none? do |character|
    if character == '('
      balance_counter += 1
    elsif character == ')'
      balance_counter -= 1
    end

    balance_counter < 0
  end

  balance_counter.zero?
end

=begin
# LS SOLUTION
# A string is balanced if for every left parenthesis, we have a right parenthesis.

just break early when iterating, no need for another return
=end

def balanced3?(string)
  parentheses = 0

  string.each_char do |character|
    if character == '('
      parentheses += 1
    elsif character == ')'
      parentheses -= 1
    end

    break if parentheses < 0
  end

  parentheses.zero?
end

=begin
FURTHER EXPLORATION
There are a few other characters that should be matching as well. Square brackets and curly brackets normally come in pairs. Quotation marks(single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

[], {}, '', ""

RULES:
- square/curly/parentheses must lead with left bracket
- quotations (single/double) order doesn't matter - must just be balanced
  - can't use up/down counter for quotation marks

ALGORITHM:
Given a string,
- SET open_brackets to an array of [ { (
- SET closed_brackets to an array of ] } )

- DETERMINE if brackets are balanced * helper
  - iterate through each char of the string
  - if char is an open bracket, increment counter by 1
  - if char is a closing bracket, decrement counter by 1

- DETERMINE if single/double quotes are balanced * helper
  - check if count of ' and " in string is even
  - return true if yes, false if no

- RETURN true if brackets are balanced and quotes are balanced, false if not
=end

def balanced_brackets?(string)
  brackets = 0

  string.each_char do |character|
    if ['[', '{', '('].include?(character)
      brackets += 1
    elsif [']', '}', ')'].include?(character)
      brackets -= 1
    end

    break if brackets < 0
  end

  brackets.zero?
end

# Refactor
def balanced_brackets?(string)
  brackets = 0

  string.each_char do |character|
    brackets += 1 if character =~ /[\[{(]/
    brackets -= 1 if character =~ /[\]})]/
    break if brackets < 0
  end

  brackets.zero?
end

def balanced_quotes?(string)
  string.count("\"'").even?
end

def balanced?(string)
  balanced_brackets?(string) && balanced_quotes?(string)
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
p balanced?('[hello]') == true
p balanced?(']hello[') == false
p balanced?('m{oo}n') == true
p balanced?('m{{oon}{}') == false
p balanced?('"hello"') == true
p balanced?('"hel"lo"') == false
p balanced?("'goodnight moon'") == true
p balanced?("good'''night") == false

# TIME - original solution: 10:00