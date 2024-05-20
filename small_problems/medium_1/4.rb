=begin

PROBLEM:
Given a light_number, n, write a method that determines how many light switches are on after n reptitions of toggling switches.
- n is both the light_number of lights and the light_number of repetitions
- toggling on repetitions:
  - first: toggle all ()
  - second: toggle 2, 4, 6
  - third: toggle 3, 6, 9
  - fourth: toggle 4, 8, 12


Input:
- integer (n - # of switches, # of rounds)

Output:
- array (containing integers, light_numbers of lights left on)

Rules:
- lights start off
- on first round, toggle all repetitions
- on each round, toggle all switches that are multiples of the round light_number
  - ex: round 1, all are multiples, toggle all
  - round 2: multiples 2, 4, 6
  .. etc
- each light connected to only 1 switch
- each light/switch is light_numbered 1..n
- n is light_number of switches
- n is light_number of rounds of toggling
- return an array with light_numbers of lights that are on after all rounds


EXAMPLES:
n = 5
start: 5 lights, all off

round 1: toggle all switches, all 5 on
round 2: toggle 2, 4, 6
round 3: toggle 3, 6, 9
round 4: toggle 4, 8, 12
round 5: toggle 5, 10, 15


    L    L   L   L   L 
(1) on  on  on  on   on
(2) on  off on  off  on
(3) on--off-off-off--on
(4) on--off-off-on--on
(5) on--off-off-on--off

lights on: 1, 4 => [1, 4]

DATA STRUCTURES:
start: integer ->

nested array of light light_number with on/off status
n = 5
start: [[1, off], [2, off] ...]

iterate through subarrays
[1, off]
if subarray[0] is a factor of n
  - "toggle" method - makes off on, vice versa
  - changes subarray[1] to opposute

end: array of nestedlight status
ex: [[1, on], [2, off] ...]

select lights that are on
return new array of on light light_numbers [1, 4]

ALGORITHM:
given a light_number, n
- SET "lights" to an nested array:
  - 1st element is light_number, 1..n
  - 2nd element is 'off'
- iterate from 1..n (# of rounds) round_light_number
- on each "round":
  - iterate through lights array
    - each subarray is [light light_number, status]
    - check if light light_number is a multiple of round_light_number
      - a multiple is if the light_number is evenly divided by round_light_number (% == 0)
      - if true:
        - "toggle switch method" - change status to opposite
      - if false: continue iterating
- SET on_lights to empty array
- iterate through lights array to select all lights that are on
  - each subarray is [light light_number, status]
  - if status == 'on', add the light light_number to on_lights
- return on_lights array


** toggle switch **
- takes 1 arg, a string ('on' or 'off')
- if arg is 'on', return 'off'
- if arg is 'off', return 'on'

     
n = 5
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
=end

def toggle_switch(status)
  status == 'on' ? 'off' : 'on'
end


def lights_on(n)
  lights = (1..n).to_a.zip(['off'] * n) 
  1.upto(n) do |round_number|
    lights.each do |light_number, status|
      if light_number % round_number == 0
        lights[light_number - 1][1] = toggle_switch(status)
      end
    end
  end

  on_lights = lights.select do |light_number, status|
    status == 'on'
  end.map { |light_number, _| light_number }

end

p lights_on(1) == [1]
p lights_on(5) == [1, 4]
p lights_on(10) == [1, 4, 9]
p lights_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# TIME: 39 mins