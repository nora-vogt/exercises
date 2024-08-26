=begin
When will I Retire?

Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

ALGORITHM:
- GET user's current age
  - SET to age
- GET user's desired retirement age
  - SET to retirement_age
- DETERMINE the current year
  - SET to current_year
- CALCULATE years of work remaining
  - subtract age from retirement_age
  - SET result to years_work_remaining
- CALCULATE retirement year
  - add years_work_remaining to current_year
  - SET to retirement_year
- DISPLAY output
=end

print "What is your age? "
age = gets.to_i

print "At what age would you like to retire? "
retirement_age = gets.to_i

current_year = Time.now.year
work_years_remaining = retirement_age - age
retirement_year = current_year + work_years_remaining

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{work_years_remaining} years of work to go!"
