require 'pry'
=begin
# PROBLEM
Create a clock that is independent of date. The clock should have the functionality to add or substract minutes.

Rules:
- Adding/subtracting minutes should not mutate a Clock object; instead, create a new object
- Two clocks with same time should be equal to each other -- need to implement #==
- Do not use any built-in Date/Time functionality
- Clock uses 24-hr time
- can add/subtract more than 60 minutes
- clock should wrap around at midnight

# EXAMPLES

# creating a new clock
Clock.at(8).to_s => "8:00"
Clock.at(11, 9).to_s => '11:09'

# adding minutes -> return a new Clock
Clock.at(10) + 3 => to_s => 10:03

# substracting minutes
Clock.at(0) - 50 => to_s => 23:10
- makes a clock 00:00

# wrap around at midnight - positive
Clock.at(23, 30) + 60 => to_s => 00:30

# wrap around at midnight - positive - negative
Clock.at(0, 30) - 60 => to_s => 23:30

# DATA STRUCTURES

# BRAINSTORM
Clock
@hours - from 0-23
@total_minutes - from 0 to 59

Clock.at(23,30)
 #new(23, 30)
 <clock @hours = 23, @total_minutes = 30>
 store values as integers for arithmetic operations

+(60) - always adding minutes
@hours = 23
@total_minutes = 30

60 - divmod to get hours and remaining minutes?
and how to standardize to 24 hours?

Clock.at(10) + 3061 => to_s => 13:01
@hours = 10
@total_minutes = 00
3061.divmod(60) => [51h, 1 min] -> save minutes

take hours - 51 - divmod by 24 to standardize day
51.divmod(24) => [2days, 3hours] -> save hours

10 + 3 = 13
0 + 1 = 1
13:01

works with subtraction?
Clock.at(10) - 3061 => to_s => 06:59
@hours = 10
@total_minutes = 00

3061.divmod(60) -> [51, 1] -> save minutes
51.divmod(24) -> [2, 3] -> save hours

10 - 3 = 7
0 - 1 = -1 
7, -1 => 6:59

# wrap hours and minutes
hours:
0-23
if result > 23, say 27
  result - 23, 27 - 23 => 4
  add 4 to hours

if result < 0, say -3

OR, convert all hours to minutes - just work in minutes?
1440 minutes/day
0, 1440 are both 00:00
1439 is max minute - 23:59

Clock.at(10) - 3061 => to_s => 06:59
10 * 60
@total_minutes = 600

600 - 3061 = -2461

STANDARDIZE MINUTES
-3061
3061.divmod(1440) => [2, 181minutes] -> save 181 minutes
- return 181 minutes

600 - 181 = 419
419.divmod(60) => [6, 59]

****
Clock.at(23, 30) + 60
@total_minutes = (23 * 60) + 30 = 1410

1410 + 60 => 1470 if result > 1439, standardize minutes
1440 => standardize => 30 mins

30.divmod(60) => [0, 30]

- convert given h, m to @total_minutes
- add/subtract the arg with +(n) -(n), result is minutes
- standardize minutes - standardizes given minutes to 1440 min day
  - given an integer (pos or neg)
  - divide integer by 1440
    - disregard quotient
    - return the remainder - this is minutes

- convert standardized minutes to hh:mm
  - divide minutes by 60
    - quotient is hours
    - remainder is minutes



# ALGORITHM
#constructor - takes 1 or two args (hours, minutes)
- multiply first arg (hours) by 60
  - if given second arg, add second ar
- set result to @total_minutes

# standardize_minutes - standardizes given minutes to 1440 min day
  - given an integer (pos or neg)
  - divide integer by 1440
    - disregard quotient
    - return the remainder - this is remaining minutes

#to_s - returns a string of time in format HH:MM
- convert @total_minutes to hours and minutes
- format into a string with HH:MM format - have leading 0 if hours < 10

#+ - takes an int argument
- add arg to @total_minutes, set to result
- standardize resulting minutes
- convert minutes to hours and minutes
- Create a new Clock object, passing the hours and minutes
- return new Clock

#- - takes an int argument
- subtract arg from @total_minutes, set to result
- standardize resulting minutes
- convert minutes to hours and minutes
- Create a new Clock object, passing the hours and minutes 
- return new Clock

#== - takes a Clock arg
- compare total_minutes of current clock to other clock
  - Integer#== - return a boolean

::at - two args: hour, minute (optional)
- initializes a new Clock object
=end

class Clock
  MINUTES_PER_DAY = 1440
  MINUTES_PER_HOUR = 60

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def +(minutes)
    result = total_minutes + minutes
    standardized_minutes = standardize(result)
    hours, minutes = convert_to_hours_and_minutes(standardized_minutes)
    Clock.at(hours, minutes)
  end

  def -(minutes)
    result = total_minutes - minutes
    standardized_minutes = standardize(result)
    hours, minutes = convert_to_hours_and_minutes(standardized_minutes)
    Clock.at(hours, minutes)
  end

  def ==(other_clock)
    total_minutes == other_clock.total_minutes
  end

  def to_s
    hours, minutes = convert_to_hours_and_minutes(@total_minutes)
    sprintf('%02d:%02d', hours, minutes)
  end

  protected

  attr_reader :total_minutes

  private

  def initialize(hours, minutes=0)
    @total_minutes = (hours * MINUTES_PER_HOUR) + minutes
  end

  def standardize(minutes)
    minutes.divmod(MINUTES_PER_DAY).last
  end

  def convert_to_hours_and_minutes(minutes)
    minutes.divmod(MINUTES_PER_HOUR)
  end
end

# p Clock.new(10).standardize(1470) == 30
# p Clock.new(10).standardize(3061) == 181
# p (Clock.at(10) + 3).to_s

=begin
# DRAFT 2 - instead of storing @total_minutes, store the @hours and @minutes
=end