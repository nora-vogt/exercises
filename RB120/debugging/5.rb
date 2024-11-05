class File
  attr_accessor :name, :byte_content

  # FORMAT = nil # If we do this, the code runs, but #to_s will interpolate `nil` for the value of `FORMAT`, which isn't what we want.

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    #"#{name}.#{FORMAT}"
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

=begin
You started writing a very basic class for handling files. However, when you begin to write some simple test code, you get a NameError. The error message complains of an uninitialized constant File::FORMAT.

What is the problem and what are possible ways to fix it?

The `File#to_s` method references the constant `FORMAT`, which is not defined in the `File` class. Each of `File`'s three subclasses defines `FORMAT`. Even though these subclasses inherit `#to_s` from `File`, constant scope is first resolved lexically, which means that each time `#to_s` is invoked, Ruby will look within the `File` class for the value of `FORMAT`. Not finding it, Ruby will then traverse up the inheritance chain, searching for the value, and not finding it, will raise a `NameError`. Ruby never searches the subclasses for `Format`, because they are not part of `Format`'s resolution chain.

To fix this, we should use the namespace operator to direct Ruby where to find the value of `FORMAT`. We can write `self.class::FORMAT` in `#to_s`, and `#class` will return the name of the current class, and Ruby will look within that class to find the value of `FORMAT`.

LS Additions:
- The name of the class returned by `self.class` will be determined by which subclass is calling `#to_s` - in this example, it's the `MarkdownFile` class.
- Alt solution: define a `format` method in each subclass

Further Exploration

If you aren't familiar with Module#alias_method, take a moment to view Ruby's documentation. You don't need to memorize this method, but get in the habit of referring to documentation when you see code you aren't familiar with.
=end

