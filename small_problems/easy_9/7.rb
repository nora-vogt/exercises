=begin
Problem: Write a method that calculates the average of three given integers. Return the letter value (grade) associated with that number.

Input: three integers (grades)
Output: String (A-F grade)

Rules:
- Given grades will be between 0 and 100
- No need to account for negative values or values greater than 100

Numerical Score Letter   Grade
90 <= score <= 100   'A'
80 <= score < 90   'B'
70 <= score < 80   'C'
60 <= score < 70   'D'
0 <= score < 60   'F'

ALGORITHM:
- given three integer grades,

- create a GRADES hash
  - keys are letter score as string
  - values are a range according to given info

- add up all given integers, divide by three, assign to "average"
- iterate through the GRADES hash
  - check if value includes average
  - if yes: return the key associated with value
    - if no: continue
=end

GRADES = { 'A' => (90..100),
          'B' => (80...89),
          'C' => (70..79), 
          'D' => (60..69),
          'F' => (0..59)
}

# First Solution
def get_grade(*grades)
  average = grades.sum / grades.count
  grade = ''

  GRADES.select do |letter, range|
    grade = letter if range.include?(average)
  end

  grade
end

# # Second Solution
# def get_grade(one, two, three)
#   average = (one + two + three) / 3

#   GRADES.select do |letter, range|
#     range.include?(average)
#   end.keys.first
# end

# LS Solution .. just use range in method
def get_grade(*grades)
  average = grades.sum / grades.count
  case average
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

# Further Exploration:
# how to handle this if there was a possiblity of extra credit grades causing it to exceed 100 points?

# Use Rubys Infinite Range syntax (1..)
def get_grade(*grades)
  average = grades.sum / grades.count

  case average
  when 90..    then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

# Or we could make above 100 an A+
def get_grade(*grades)
  average = grades.sum / grades.count

  case average
  when 100..    then 'A+'
  when 90..100  then 'A'
  when 80..89   then 'B'
  when 70..79   then 'C'
  when 60..69   then 'D'
  else               'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(99, 105, 103) == "A+" 

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"