=begin
Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

- A divisor is a number by which the input number can be evenly divided
=end

# def divisors(num)
#   (1..num).select do |candidate| 
#     num % candidate == 0
#   end
# end

# Faster... but not quite there
# def divisors(num)
#   result = [1]
#   (2..(num/2)).each do |candidate| 
#     if num % candidate == 0
#       result << candidate 
#     end
#   end
#   result << num unless num == 1

#   p result
# end

# Student solution
def time_it
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "Took #{end_time - start_time} sec."
end

def divisors(num)
  result = []
  (1..Math.sqrt(num)).each do |candidate|
    result << candidate << num / candidate if num % candidate == 0
  end
  p result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]



p time_it { divisors(99400891) == [1, 9967, 9973, 99400891] } # may take a minute
#p divisors(999962000357) == [1, 999979, 999983, 999962000357]

# Half of the divisors give you the other half


p divisors(12) == [1, 2, 3, 4, 6, 12]
=begin
divisors of 12
1, 2, 3, 4, 6, 12


how to know when we've got the first half of divisors?
first * last
second * last - 1
third * last - 2

=end
