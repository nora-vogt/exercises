require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def initialize
    @experience = false
  end

  def hire
    raise NoExperienceError unless @experience
    puts "hiring the employee!"
  end
end

class RandomTest < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_hiring_inexperienced_employee_raises_error
    assert_raises NoExperienceError do 
      @employee.hire
    end
  end
end