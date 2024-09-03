=begin
1000 Lights

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n number_of_lights.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n number_of_lights.

RULES/NOTES:
- 1 light/switch. start: off
- first pass: toggle all switches (all on)
  - second pass: toggle evens: 2, 4, 6
    - third pass: toggle odds: 3, 6, 9
- on each pass, toggle switches that are a multiple of that pass number
- return an array with the number of each light that is 'on' after all passes
- input is n, there will be n rounds of toggling

EXAMPLES:
Example with n = 5 lights:

    round 1: every light is turned on
    round 2: lights 2 and 4 are now off; 1, 3, 5 are on
    round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
    round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
    round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

DATA STRUCTURES:
Input: Integer (number of lights/switches)

lights are in a hash

Output: array of integers (light numbers that are on)

BRAINSTORM:
array of hashes
[{1 => off}]

array of arrays
[[0, off]]

just a hash
{1 => off, 2 => off}
if key is multiple of 1, toggle (all on)
  if key is multiple of 2, toggle (2, 4), now off again

ALGORITHM:
Given a count of lights, an integer, light_count
- CREATE the lights hash
    - keys are numbers 1 to light_count
    - values are all initially 'off'
- ITERATE from 1 up to light_count (pass)
    - for each integer (pass number)
    - ITERATE through the lights hash
      - for each number/status
      - IF number is a multiple of pass
        - toggle the value to its opposite: *
          if 'off', make 'on' and vice versa

- toggle_light! helper method
  - given a hash, a key
  - reassign the given value to its opposite for the key
  - if 'off', make 'on' and vice versa

- SELECT the light numbers that are 'on'
  - ITERATE through the lights hash
    - for each light number/status
    - select the light if status is 'on'
  - get an array of keys only from returned hash #keys
- RETURN array of selected keys
=end

def initialize_lights_hash1(number_of_lights)
  (1..number_of_lights).to_a.zip(Array.new(number_of_lights, 'off')).to_h
end

def initialize_lights_hash(number_of_lights)
  (1..number_of_lights).each_with_object({}) do |number, hash|
    hash[number] = 'off'
  end
end

def toggle_light!(lights, position)
  # refactor
  lights[position] = (lights[position] == 'off') ? 'on' : 'off'

  # if hash[key] == 'off'
  #   hash[key] = 'on'
  # else
  #   hash[key] = 'off'
  # end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights_hash(number_of_lights)

  1.upto(number_of_lights) do |pass_number|
    lights.each do |position, status|
      if position % pass_number == 0
        toggle_light!(lights, position)
      end
    end
  end

  lights.select { |_, status| status == 'on'}.keys
end

# hash = { 1 => 'off'}
# hash2 = { 2 => 'on' }
# toggle_light!(hash, 1)
# toggle_light!(hash2, 2)
# p hash
# p hash2

p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]
p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# TIME: 17:08