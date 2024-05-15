=begin
fizbuzz!!!
Problem: Write a method that takes two integer arguments.
Print all numbers from the starting to ending number, except: if a number is divisble by 3, print "Fizz" and if a number is divisible by 5 print "Fizzbuzz", if a number is divisible by 3 and 5 print "FizzBuzz"

Input: two integers (start, end)
Output: printed values - integer/fizz/buzz/fizzbuzz (method will return nil)

Rules:
- if number evenly divisible by 3 and 5, print FizzBuzz
- number evenly divisible by 3, print Fizz
- number evenly divisible by 5, print Buzz
- otherwise print the number
- print output on one line, separated by commas

ALGORITHM:
- given two integers, "start_num", "end_num"
- create a range from start_num..end_num
- iterate over that range
  - check if current number is evenly divisible by 3 and 5
    - if yes: print FizzBuzz
  - check if current number is evenly divisible by 5
    - if yes: print Buzz
  - check if current number is evenly divisible by 3
    - if yes: print Fizz
  - otherwise print the number
- all values printed on 1 line separated by a comma
=end

# def fizzbuzz(start_num, end_num)
#   result = []
#   (start_num..end_num).each do |number|
#     if number % 5 == 0 && number % 3 == 0
#       result << "FizzBuzz"
#     elsif number % 5 == 0
#       result << "Buzz"
#     elsif number % 3 == 0
#       result << "Fizz"
#     else
#       result << number
#     end
#   end
#   print result.join(', ')
# end

# refactor
def fizzbuzz(start_num, end_num)
  result = (start_num..end_num).map do |number|
    if    number % 5 == 0 && number % 3 == 0 then 'FizzBuzz'
    elsif number % 5 == 0                    then 'Buzz'
    elsif number % 3 == 0                    then 'Fizz'
    else                                           number
    end
  end
  print result.join(', ')
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz