=begin
Range#step returns `self` - the original range
This implementation returns the `step_value`, the amount we are incrementing by on each iteration
=end

def step(start_value, end_value, step_value)
  current_value = start_value
  loop do
    yield(current_value)
    current_value += step_value
    break if current_value > end_value
  end

  step_value
end

# LS Solution - returns current_value
def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point # check for break first, since we are returning current_value
    current_value += increment
  end
  current_value
end

# student solution
def step(start, stop, step)
  value = start
  result = []

  while value <= stop
    result << value
    yield(value)
    value += step
  end

  result
end

step(1, 10, 3) { |value| puts "value = #{value}" }