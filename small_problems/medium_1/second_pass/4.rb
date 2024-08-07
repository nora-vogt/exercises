=begin
1000 Lights

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle_lights every one of them. You go back to the beginning, and on this second pass, you toggle_lights switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle_lights switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.


PROBLEM: You are given a number, n, which is both the number of lights and the number of rotations. On each rotation, toggle_lights the lights on/off. The rule for toggling is:
    - toggle_lights lights if light number evenly divisible by 1
    - Then toggle_lights lights if light number evenly divisible by 2
    - increase the divisor by 1 on each iteration

RULES:
- position of lights to toggle_lights starts at 1, increments by 1 on each iteration
  - a light should be toggle_lightsd if its index is evenly divisible by the position
- n is number of lights/switches
- n is also number of rotations
- light number starts at 1
- when considering index, use index + 1 to match light position

EXAMPLES:
[1, 2, 3, 4, 5]
- need to track light number
- need to track on/off position

[{1 => false}, {2 => false}, ]

{1 => false, 2 => false} - use keys of numbers as position

Example with n = 5 lights:

    round 1: every light is turned on
    round 2: lights 2 and 4 are now off; 1, 3, 5 are on (toggle_lights 2, 3)
    round 3: lights 2, 3, and 4 are now off; 1 and 5 are on (toggle_lights 3)
    round 4: lights 2 and 3 are now off; 1, 4, and 5 are on (toggle_lights 4)
    round 5: lights 2, 3, and 5 are now off; 1 and 4 are on (toggle_lights 5)

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].



DATA STRUCTURES:
Input: n (lights/rotations)


hash
  - each key is a number (1-n)
  - each value starts at false (off)

selection - array to return
  - get the keys where value is true at the end

Output: Array containing the numbers of the lights that are on at the end

ALGORITHM:
Given a number, n

* Create the initial hash *
  - iterate through numbers 1 - n
  - for each number, create a pair in the hash
    - key is number
    - value is false

* toggle_lights the lights *
- iterate from 1 upto n [toggle_lights_position]
  - iterate through the hash [number, state]
    - if number is evenly divisible by toggle_lights_position - %
      - change state to its opposite
        - false -> true
        - true -> false

* select 'on' lights *
- iterate through the lights hash - selection [number, state]
  - if the state is true (on), select the light for the new hash
  - get an array of keys from the selected hash
  - return that array
=end

def toggle_lights1(n)
  light_states = (1..n).each_with_object({}) { |num, hash| hash[num] = false }

  1.upto(n) do |toggle_lights_position|
    light_states.each do |number, state|
      if number % toggle_lights_position == 0
        light_states[number] = !state
      end
    end
  end

  p light_states.select { |_, state| state }.keys
end

# Refactor
# Initialize lights hash
def initialize_lights(n)
  (1..n).each_with_object({}) { |number, hash| hash[number] = 'off'}
end

# Toggle the lights off/on, mutating the lights hash
def toggle_every_nth_light!(lights, nth)
  lights.each do |light_number, state|
    if light_number % nth == 0
      lights[light_number] = state == 'off' ? 'on' : 'off'
    end
  end
end

# Select only the lights that are on
def find_lights(lights, status)
  lights.select { |_, state| state == status }.keys
end

=begin
- format the string to output - accept an arg, "off" or "on" for state
  - if array is empty, "all lights are #{on/off}"
  - if array has one element, "#{number} is on"
  - if array has two elements, join by " and "
  - if array has more than 2 elements
    - join all but last by comma space
    - join last by ", and #{number}" are now off
=end

def format_output(light_numbers, state)
  if light_numbers.empty?
    ''
  elsif light_numbers.all?
  end
end

def print_status(lights)
  on_lights = find_lights(lights, 'on')
  off_lights = find_lights(lights, 'off')

  p format_output(on_lights)
  # "lights #{} #{are/is} now off" + ";" "lights #{} #{are/is} now on"
end

# Whole program - iterate n number of times to toggle lights
def toggle_lights(n)
  lights = initialize_lights(n)
  
  1.upto(n).each do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
    print_status(lights)
  end

  find_lights(lights, 'on')
end


p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]
#p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# TIME: 21:50

# LS Solution
  # Same approach, except using helper methods
  # Instead of true/false for states, they used string "on"/"off" and ternary statements to swap the state.
  # Though it works the same, that is clearer than my approach.
  # Refactored my solution to be similar.

=begin
# Further Exploration
1. Why is every light that is on at the end a perfect square?
  - a perfect square is the product of a number multiplied by itself
    - 9 * 9 = 81 ---> 9**2 = 81

2. What if we used an array instead of a Hash? How would that change the problem?
  - nested array of light number and position
  - the method would behave very similarly, the only things that change are how we
    a. intitialize the lights object
    b. access elements to toggle the lights
      [[1, 'off']]

3. Write a method that prints the output from problem description on each round:
    (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.")

ALGORITHM:
- given the lights hash,
- create an of 'on' light numbers -- modify "find_state_lights" to accept the state, on/off
  - select lights from hash where state == 'on'
  - return an array of keys from hash
- create an array of 'off' light numbers
  - select lights from hash where state == 'off'
  - return an array of keys from the hash


- format the string to output - accept an arg, "off" or "on" for state
  - if array is empty, "all lights are #{on/off}"
  - if array has one element, "#{number} is on"
  - if array has two elements, join by " and "
  - if array has more than 2 elements
    - join all but last by comma space
    - join last by ", and #{number}" are now off





def print_status(lights)
  on, off = lights.
end
=end