require 'date'
require 'pry'
=begin
# PROBLEM
Determine the exact date of a meetup in a given month and year based on a certain descriptor word.

Descriptors are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'

Days of week are strings, case insensitive: 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'

RULES:
- descriptors are case-insensitive
- teenth means: the dates of the month that end in "teenth" like "thirteenth" - "nineteenth"
  - each day of week M-S will have exactly one "teenth" day each month.
- If the desired weekday/descriptor doesn't match a valid date (such as a month without a 5th Wednesday), return nil



# EXAMPLES
2nd Wednesday of May 2021 => 12th of May, 2021

# DATA STRUCTURES
Create a new object input:
- month number (1-12)
- year (like 2021)

#day input:
- string of weekday (M-F - case insensitive)
- descriptor (first, last, etc - case insensitive)

output: a Date object - pass year, month, day  OR nil if invalid

# BRAINSTORM
Meetup.new(2013, 3)
meetup.day('Monday', 'first') => Date.civil(2013, 3, 4)

Meetup.new(2016, 11)
meetup.day('Tuesday', 'teenth') => Date.civil(2016, 11, 15), 

Meetup.new(2016, 2)
meetup.day('Sunday', 'fifth') =>  nil


High level:
- Generate a range of Date objects for the given month
- Select all dates that match the given weekday
- Select the date that matches the given schedule
  - If nil, return nil
  - If a valid date, convert into an integer day
- If valid date, create a new Date object with year, month, day
- If no valid date, return nil

Generate a range of Dates
- from first day of given month/year, to the last day of the month (#next_month.prev_day)
- iterate through range, select all date objects where the weekday (i.e. monday) matches
- array of selected weekdays (date objs)

next, need to select correct date based on descriptor - or nil

'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'

teenth - iterate through array, use #day to get day (integer) of each date
- return that date object if (13..19) includes the current day

the rest can use index position in weekday array

first => 1
second => 2
teenth => [13..19]


# ALGORITHM
#constructor - takes year and month args (integers)
- creates a new Meetup object
- assign year to @year, month to @month

#day - takes two args, string weekday, string descriptor
- convert weekday and descriptor to lowercase
- set weekdays to array returned by select_weekdays
- set day to return value of find_date
- check if day has a value or is nil
  - if nil, return nil
  - if value, create a new Date object, pass in @year, @month and day, and return that object

# find_date(weekday, descriptor) - returns an integer day or nil
- select correct date based on descriptor, assign to "date"
- case statement, based on descriptor string
- when first, return weekdays[0]
- when second, return weekdays[1]
- when third, return weekdays[2]
- when fourth, return weekdays[3]
- when fifth, return weekdays[4] (will be a date or nil - correctly)
- when last, return weekdays [-1]
- when teenth, return find_teenth(weekdays)

- check if date has a value or is nil
  - if value, call #day on date and return that value
  - if nil, return nil


# select_weekdays - takes 1 arg, the weekday string
- iterate through range of dates, from first day of @month in @year
 to last day of @month in @year - select
  - if the current date matches the given weekday, select the date

# find_teenth - given an array of date objects
- iterate through array of date objects
  - get the day of the object (integer)
  - if (13..19) includes the day, stop iterating and return that date object
- otherwise return nil
=end

# First Draft
class Meetup
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    weekdays = select_weekdays(weekday.downcase)
    day = find_date(weekdays, schedule.downcase)
    day.nil? ? day : Date.civil(@year, @month, day)
  end

  private

  def select_weekdays(weekday)
    current_month = (Date.new(year, month)..Date.new(year, month, -1)) # can pass -1 as last day of month
    #current_month = (Date.new(year, month)...Date.new(year, month).next_month)
    current_month.select do |date|
      case weekday
      when 'monday'    then date.monday?
      when 'tuesday'   then date.tuesday?
      when 'wednesday' then date.wednesday?
      when 'thursday'  then date.thursday?
      when 'friday'    then date.friday?
      when 'saturday'  then date.saturday?
      when 'sunday'    then date.sunday?
      end
    end
  end

  def find_date(weekdays, schedule)
    date = case schedule
      when 'first'  then weekdays[0]
      when 'second' then weekdays[1]
      when 'third'  then weekdays[2]
      when 'fourth' then weekdays[3]
      when 'fifth'  then weekdays[4]
      when 'last'   then weekdays[-1]
      when 'teenth' then find_teenth(weekdays)
      end
  
    date ? date.day : nil
  end

  def find_teenth(dates)
    dates.find { |date| /(13|14|15|16|17|18|19)/ =~ date.day.to_s }
  end
end

# Meetup.new(2013, 3).day('Monday', 'first')
# Meetup.new(2025, 3).day('ThurSDAy', 'TEENTH')
# p Meetup.new(2015, 10).day('Wednesday', 'fifth') == nil

=begin
# Refactoring ideas
- Convert the weekday string to a symbol with ? appended, use as a method name to find the correct weekday
- schedule as a constant (array, hash?) to avoid a second case statement

Make SCHEDULE_INDEX hash
{ 'first' => 0,
  'second' => 1,
  'third' => 2,
  'fourth' => 3,
  'fifth' => 4
  'last' => -1
}

#day
- is redundant. #find_date already returns a Date object or nil, just use the return value of that method.

# find_day
- check if schedule is teenth, if yes: call find_teenth
  - otherwise: get value for corresponding key in SCHEDULE_INDEX hash
  - get element in weekdays array at that index

# select_weekdays
- convert weekday string into a symbol ending with ?
  - append ? to string, convert to symbol
- use symbol as method name with & to select dates with a matching weekday
=end
class Meetup
  attr_reader :year, :month

  SCHEDULE_INDEX = {
    'first' => 0,
    'second' => 1,
    'third' => 2,
    'fourth' => 3,
    'fifth' => 4,
    'last' => -1
  }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    matching_weekdays = select_weekdays(weekday.downcase)
    find_date(matching_weekdays, schedule.downcase)
  end

  private

  def select_weekdays(weekday)
    weekday_sym = (weekday << '?').to_sym
    current_month = (Date.new(year, month)..Date.new(year, month, -1))
    current_month.select(&weekday_sym)
  end

  def find_date(weekdays, schedule)
    case schedule
    when 'teenth' then find_teenth(weekdays)
    else               weekdays[SCHEDULE_INDEX[schedule]]
    end
  end

  def find_teenth(dates)
    dates.find { |date| /1[3-9]/ =~ date.day.to_s }
  end
end

=begin
# LS Solution
- Determine the earliest possible day of the month that a week can start on, create a hash with schedule string keys / corresponding integer day values
- determine the first/last possible days for the meetup
- Check each possible day, compare to given weekday

- create SCHEDULE_START_DAY hash
  - keys are schedule strings, values are integer earliest possible day of month (except for last, which references nil)

# constructor 
  - set @year and @month
  - use -1 with Date.civil to find the last day of the month (#day) -> returns an integer, set to @days_in_month

# day - takes weekday string, schedule string
- downcase both arg strings
- find the first possible day in month that could meet the target schedule 
  - #first_day_to_search
- find the last possible day in month that could meet target schedule
  - take whichever value is lowest: first_possible_day + 6, or value of @days_in_month
    - this handles scenario where there is a fifth weekday. 5th week starts on the 29th, so can't add 6 more days to make a full week in same month.
- iterate through range of integers, first_possible_day to last_possible_day
  - create a new Date object, using current day as day value
  - stop iterating and return the new Date obj if that date matches the given weekday
  - #day_of_week_is?

# first_day_to_search - takes the schedule descriptor string
  - if the schedule is a key in SCHEDULE_START_DAY hash, return value
  - otherwise (schedule is 'last'), return @days_in_month - 6 to get first day of last week of month

#day_of_week_is? - takes a date obj, weekday string
  - case statement for weekday string
  - check if any of the `-day?` methods returns true for that date
=end

class Meetup
  SCHEDULE_START_DAY = {
    'first' => 1,
    'second' => 8,
    'third' => 15,
    'fourth' => 22,
    'fifth' => 29,
    'teenth' => 13,
    'last' => nil
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase

    first_possible_day = first_day_to_search(schedule)
    last_possible_day = [first_possible_day + 6, @days_in_month].min

    (first_possible_day..last_possible_day).find do |day|
      date = Date.civil(@year, @month, day)
      break date if day_of_week_is?(date, weekday)
    end
  end

  private

  def first_day_to_search(schedule)
    SCHEDULE_START_DAY[schedule] || (@days_in_month - 6)
  end

  def day_of_week_is?(date, weekday) # rubocop:disable Metrics/CyclomaticComplexity
    case weekday
    when 'monday'    then date.monday?
    when 'tuesday'   then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday'  then date.thursday?
    when 'friday'    then date.friday?
    when 'saturday'  then date.saturday?
    when 'sunday'    then date.sunday?
    end
  end
end

#p Meetup.new(2015, 11).day('Thursday', 'fifth')