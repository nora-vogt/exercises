class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end

  def display_books
    books.each(&:display_data)
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

#community_library.books.display_data
community_library.display_books

=begin
On line 42 of our code, we intend to display information regarding the books currently checked in to our community library. Instead, an exception is raised. Determine what caused this error and fix the code so that the data is displayed as expected.

Right now, the `display_data` method is being called on the array returned by `community_library.books`, which is an array that references Book objects. `display_data` is an instance method of the `Book` class, meaning that it can be only called on instances of `Book` objects, not on an `Array` object. To fix this, we could define a method called `display_books` in the `Library` class that iterates through the `@books` array, calling `display_data` for each unique `Book` object in the array. Then, we will change line 42 to `community_library.display_books`

# LS Keywords to add: The `Array` class does not have a `display_data` method, so a `NoMethodError` was raised.
=end

