require 'pry'
class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    #binding.pry # tasks is referencing nil for some reason, but @tasks correctly references the array
    # because the code is tasks =, this is initializing and assigning a local variable. So when we call #select on tasks, we're invoking the method on the value referenced by the local var. Since it hasn't been assigned yet, tasks returns nil, raising the error.
    # variable shadowing - the local tasks shadows the setter/getter tasks
    # I was confused when checking with binding.pry first - even though the binding is on a line before the local var, it seems Ruby still initializes the local var and assigns it the default value of zero. This works when testing other local vars too.

    high_priority_tasks = tasks.select do |task|
      task.priority == :high
    end

    display(high_priority_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks

=begin

Task Manager

Valentina is using a new task manager program she wrote. When interacting with her task manager, an error is raised that surprises her. Can you find the bug and fix it?
=end