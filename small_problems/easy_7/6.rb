=begin
Modify previous solution to ignore non-alphabetic characters when determining letter case.

ALGORITHM:
- Given a string, "string"
- Create empty string 'result'
- create "start_upper", assign to true
- create alphabet, assign to array of all upper + lowercase chars a-z
- Iterate through array of chars of string
  - check if current char is included in alphabet array
  - if no
    - add current char to result
    - skip to next iteration
  - if yes
    - push upcased current char to result if start_upper is true
    - push downcased current char to result if start_upper is false
    - reassign start_upper to boolean opposite
- return result 
=end

# First Solution
# def staggered_case(string, start_upper: true)
#   result = ''
#   alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
#   string.chars.each do |char|
#     if !alphabet.include?(char)
#       result << char
#       next
#     elsif start_upper
#       result << char.upcase
#     else
#       result << char.downcase
#     end
#     start_upper = !start_upper
#   end
#   result
# end

# # Second Solution
# def staggered_case(string, start_upper: true)
#   result = ''
#   alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
#   string.chars.each do |char|
#     if alphabet.include?(char)
#       letter = start_upper ? char.upcase : char.downcase
#       result << letter
#       start_upper = !start_upper
#     else
#       result << char
#     end
#   end
#   result
# end

# # Third Solution - Use String#=~
# def staggered_case(string, start_upper: true)
#   result = ''
  # string.chars.each do |char|
  #   if char =~ /[a-z]/i
  #     if start_upper
  #       result << char.upcase
  #     else
  #       result << char.downcase
  #     end
  #     start_upper = !start_upper
  #   else
  #     result << char
  #   end
  # end
#   result
# end

# Further Exploration




p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('I Love Launch School!', start_upper: false, include_non_alpha: true) == "i lOvE LaUnCh sChOoL!"
p staggered_case('ignore 77 the 444 numbers', include_non_alpha: true) == 'IgNoRe 77 ThE 444 NuMbErS'