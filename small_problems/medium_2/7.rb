require 'Date'
require 'pry'
=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

- Input: year (integer)
- Output: integer (# of Friday the 13ths)

DATA STRUCTURES:
- a Date object

ALGORITHM:
- make a range of date objects from jan 01 - dec 31 for current year
- iterate through range of dates - selection
  - check if date is 13 and if date is a friday
    - if both are true: select the date
- count the number of dates in the returned array
=end

# Original Solution
def friday_13th(year)
  days_of_year = Date.new(year, 01, 01)..Date.new(year, 12, 31)
  days_of_year.select { |date| date.day == 13 && date.friday? }.size
end

#LS Solution
  # create counter of friday the 13ths
  # set thirteenth to Date object to Jan 13 of given year (Date::civil is alias for Date::new)
  # iterate 12 times (#times)
    # increment counter if thirteenth is a friday (#friday?)
    # reassign thirteenth to next month in given year (#next_month)
  # return the counter

# def friday_13th(year)
#   unlucky_count = 0
#   thirteenth = Date.civil(year, 1, 13)
#   12.times do 
#     unlucky_count += 1 if thirteenth.friday?
#     thirteenth = thirteenth.next_month
#   end
#   unlucky_count
# end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# TIME: 8:54