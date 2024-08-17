require 'date'
=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.


PROBLEM:
Given a year, count the number of Friday the 13ths in that year. return the count.

RULES:
- year will be >1752, when UK adopted gregorian calendar
- future years will use Gregorian Calendar

EXAMPLES:

DATA STRUCTURES:
Input: integer (year)

range of Date objects
  (each Date is one day, holds the properties of that day)

Output: integer (count of friday the 13ths)

ALGORITHM:
Given a year,
- CREATE a range of Date objects, from jan 1 of year to dec 31 of year
- ITERATE through the dates
  - IF date is a friday and the day is 13
  - COUNT the date

- RETURN the count

=end

def friday_13th1(year)
  (Date.new(year, 01, 01)..Date.new(year, 12, 31)).count do |date|
    date.friday? && date.day == 13
  end
end

# LS Solution
=begin
- Make a counter
- Make a Date object
  - SET to Jan 13 of given year
- Iterate 12 times
  - check if the date is a friday
  - if yes, increment counter
  - reassign the date to the same date next month (#next_month)
- return the count
=end

def friday_13th2(year)
  friday_13_count = 0
  thirteenth = Date.new(year, 01, 13)

  12.times do 
    friday_13_count +=1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end

  friday_13_count
end

# Refactor
def friday_13th3(year)
  friday_13th_count = 0
  thirteenth = Date.new(year, 01, 13)
  next_year = thirteenth.next_year.year

  while thirteenth.year < next_year
    friday_13th_count +=1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end

  friday_13th_count
end

=begin
# Student solution, using Time library
# Iterate over months in a year, from 1 - 12 -> selection
  # for each month,
  # create a new Time object using the input date, current month, and 13 as the day
  # check if the day is a friday
# return the count of selected months
=end

def friday_13th4(year)
  (1..12).select { |month| Time.new(year, month, 13).friday? }.count
end

# Refactor
def friday_13th(year)
  (1..12).count { |month| Time.new(year, month, 13).friday? }
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# TIME: 9:54