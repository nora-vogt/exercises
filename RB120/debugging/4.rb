class EmployeeManagementSystem
  attr_reader :employer

  def initialize(employer)
    @employer = employer
    @employees = []
  end

  def add(employee)
    if exists?(employee)
      puts "Employee serial number is already in the system."
    else
      employees.push(employee)
      puts "Employee added."
    end
  end

  alias_method :<<, :add

  def remove(employee)
    if !exists?(employee)
      puts "Employee serial number is not in the system."
    else
      employees.delete(employee)
      puts "Employee deleted."
    end
  end

  def exists?(employee)
    employees.any? { |e| e == employee }
  end

  def display_all_employees
    puts "#{employer} Employees: "

    employees.each do |employee|
      puts ""
      puts employee.to_s
    end
  end

  private

  attr_accessor :employees
end

class Employee
  attr_reader :name

  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
  end

  def ==(other)
    serial_number == other.serial_number
  end

  def to_s
    "Name: #{name}\n" +
    "Serial No: #{abbreviated_serial_number}"
  end

  protected

  attr_reader :serial_number

  private

  def abbreviated_serial_number
    serial_number[-4..-1]
  end
end

# Example

miller_contracting = EmployeeManagementSystem.new('Miller Contracting')

becca = Employee.new('Becca', '232-4437-1932')
raul = Employee.new('Raul', '399-1007-4242')
natasha = Employee.new('Natasha', '399-1007-4242')

miller_contracting << becca     # => Employee added.
miller_contracting << raul      # => Employee added.
miller_contracting << raul      # => Employee serial number is already in the system.
miller_contracting << natasha   # => Employee serial number is already in the system.
miller_contracting.remove(raul) # => Employee deleted.
miller_contracting.add(natasha) # => Employee added.

miller_contracting.display_all_employees

=begin
We have written some code for a simple employee management system. Each employee must have a unique serial number. However, when we are testing our program, an exception is raised. Fix the code so that the program works as expected without error.

In the `Employee` class, the reader for `@serial_number` is defined as a private method. The `Employee#==` method uses the private reader to compare the serial numbers of both the current employee, and another employee. This means that any time `EmployeeManagementSystem#exists?` is invoked, the method will call `Employee#==` to compare two employees to check if the employee is already in the system, and a `NoMethodError` will be raised because a private method can only be called by `self`, not by another instance of the class, as `other.serial_number` attempts to do on line 56.

To fix this, we could make the serial number reader a `protected` method instead, which will allow any instance of `Employee` within the class to call the method, allowing us to make an equality comparison while still restricting access to the full serial number from outside the class.
=end