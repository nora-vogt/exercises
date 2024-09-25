=begin
# Fix the Program - Books (Part 2)

Complete this program so that it produces the expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

class Book
  attr_accessor :author, :title

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
In this code, `@author` and `@title` are being initialized outside of the class on lines 18 and 19, and then the values of those instance variables are retrieved on lines 20 and 21. This means we need both setter and getter methods for `@author` and `@title.`

Further Exploration

What do you think of this way of creating and initializing Book objects? (The two steps are separate.) Would it be better to create and initialize at the same time like in the previous exercise? What potential problems, if any, are introduced by separating the steps?

By separating the steps, and by allowing the initializing of the instance variables outside the class, it opens the possibility of the author and title not matching for a book. It could be easy to accidentally assign the wrong value for one, making author/title mismatched. Our program also may not want to allow reassigning `@title` or `@author` in the public interface, as it could create unanticipated problems.

=end