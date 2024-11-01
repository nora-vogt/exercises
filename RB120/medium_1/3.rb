=begin
Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the #initialize methods in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:

    Graduate students have the option to use on-campus parking, while Undergraduate students do not.

    Graduate and Undergraduate students both have a name and year associated with them.

Note, you can do this by adding or altering no more than 5 lines of code.

Further Exploration

There is one other "form" of the keyword super. We can call it as super(). This calls the superclass method of the same name as the calling method, but here no arguments are passed to the superclass method at all.

Can you think of a way to use super() in another Student related class?

Imagine we are working only with students on the Honor Roll, we could add an `HonorsStudents` class, initialize each student to reflect their status on the Honor Roll, and invoke `super()` in `Student#initialize`.
=end
class HonorsStudents
  def initialize
    @honor_roll = true
  end
end

class Student < HonorsStudents
  def initialize(name, year)
    @name = name
    @year = year
    super()
  end

  def parking_permission
    if @parking
      puts "I've put in my time and I can park on campus!"
    else
      puts "Look like I'm taking the bus."
    end
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super # super without any args passes all args to the superclass initalize
  end
end

class ProspectiveStudent < Student
  def initialize(id_number)
    super()
  end
end

grad = Graduate.new('Lisa', 2018, true)
grad.parking_permission

undergrad = Undergraduate.new('Belinda', 2024)
undergrad.parking_permission

p grad
p undergrad