=begin
# Fix the Program - Books (Part 1)

Complete this program so that it produces the expected output:

The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

class Book
  #attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def title
    @title
  end

  def author
    @author
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.) # Interpolating the instance of `Book` assigned to `book` automatically calls `#to_s` on it, which is `Book#to_s`, which returns the string "Snow Crash", by Neil Stephenson

=begin
Further Exploration

What are the differences between attr_reader, attr_writer, and attr_accessor? Why did we use attr_reader instead of one of the other two? Would it be okay to use one of the others? Why or why not?

Instead of attr_reader, suppose you had added the following methods to this class:
def title
  @title
end

def author
  @author
end

Would this change the behavior of the class in any way? If so, how? If not, why not? Can you think of any advantages of this code?

`attr_reader` creates a getter method, which returns the value of the instance variable that is passed to the method as a symbol arg. `attr_writer` creates a setter method, which reassigns the value of the instance variable. `attr_accessor` creates both a setter and a getter method. In this case, we used `attr_reader` because we only need to access the value of `author` and `title`. We do not need to reassign either value. `attr_writer` alone wouldn't work, because that would provide us with `title=` and `author=` methods, but no `title` and `author` getter methods. `attr_accessor` would be fine if we don't mind changing our book's title and author - depends on the use case.

If instead of `attr_reader` we manually defined the methods, this would not change the behavior of the code. `attr_reader` creates precisely those getter methods - it is two options to accomplish the same thing. 

Advantages - from a solution:
Advantages of using attr_ methods

    If you use attr_* methods, all they can ever do is set or get the value of that instance variable. If you make custom getters and setters, then you have the option to do some work on those instance variables before returning or setting a value from within the getter/setter. 
=end