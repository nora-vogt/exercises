require 'pry'
#Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

#New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

=begin
P  (Understand the Problem) ++++++++++++++++++++++++++++++++++++++++++
  Inputs:
    - an Integer (representing a year)

  Outputs: 
    - a String (representing the century, with appropriate ending)

  Explicit Rules:
    - Returned string must begin with century number
    - New centuries begin in years that end in 01
    - Possible endings: st, nd, rd, th

  Implicit Rules:
    - The length of a century is 100 years
    - Need to first calculate century number, then find appropriate suffix
    - All years <= 1 are the 1st century

  Questions:
  - What should happen if 0 is entered?
   
 
E (Examples & Test Cases) ++++++++++++++++++++++++++++++++++++++++++++
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

Modeling: 
5 -> '1st'
  5 / 100 -> 0 + 1 -> 1
  - For years 1 - 100, 0 will be returned. Need to add 1.

2000 -> '20th' 
  2000 / 100 -> 20

2001 -> '21st'
  2001 / 100 -> 20 + 1 -> 21
  - If input ends in 01, add 1 to output

11201 -> '113th'
  11201 / 100 -> 112 + 1 -> 21
  - If input ends in 01, add 1 to output


1st 2nd 3rd 4th 5th 6th 7th 8th 9th 10th
101st 102nd 103rd 104th 105th 106th 107th 109th 109th 200th

century ending in 1: st
century ending in 2: nd
century ending in 3: rd
century ending in 4..10: th

D (Data Structure) +++++++++++++++++++++++++++++++++++++++++++++++++++
  start: integer
  middle: array (century + ending)
  output: string


A (Algorithm) ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
NOTES:
  - maybe do math to get century, then check if statement:
  - if given year ends in 01 - add 1 to the century output

  Given a year
  0. Create an hash "suffixes" to hold century endings (key) / suffix (value)
  1. Calculate the century
    a. If the year is <= 100
      - return the string "1"
    b. If the year ends in 00
      - return: (year / 100) converted to a string
    c. Otherwise
      - return: ((year / 100) + 1) converted to a string
    d. Assign "century" to the return value of the calculation
  3. Obtain appropriate suffix for century
    a. Convert century to a string
    b. Obtain last digit of century
    c. Obtain corresponding value in suffixes hash
    d. add the suffix to the century string
  4. Return the century string

C (Code with Intent)  ++++++++++++++++++++++++++++++++++++++++++++++++
=end

def century(year)
  suffixes = { "st" => ['1'], 
               "nd" => ['2'], 
               "rd" => ['3'], 
               "th" => %w(4 5 6 7 8 9 0)
}

  
  centuary = if year <= 100
              "1"
            elsif year.to_s[-2, 2] == "00"
              (year / 100).to_s
            else
              ((year / 100) + 1).to_s
            end

  suffixes.each do |suffix, array|
    if array.include?(centuary[-1])
      centuary << suffix
    end
  end

  p centuary
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd' 
p century(1052) == '11th' # not working
p century(1127) == '12th' # not working
p century(11201) == '113th' # not working for centaries ending in a "teen" number
