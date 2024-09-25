=begin
#Banner Class
Behold this incomplete class for constructing boxed banners.

Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

PROBLEM:
- complete the Banner class initialize, horizontal_rule, and empty_line methods to result in the banner in a box printing to the screen.
- horizontal rule: string length + 2 (spacing) dash chars, with a + at start and end
- empty line is | string length + 2 spaces |

needs:
- to initialize a @message instance variable

# Further Exploration

Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. The message in the banner should be centered within the banner of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.

default width will be message length
otherwise, if length specified: ex: 80
| message |
center the message in a line that is the length - 2, pad with spaces

if given length is too narrow: default to the length of the message
if given length is too large (>80): default to 80
# Doesn't word wrap - implement next
  - minimum width must be at least as long as the longest word in the string

=end

class Banner
  MAX_WIDTH = 80
  def initialize(message, width=message.length)
    @message = message

    if width < message.length
      @width = message.length
    elsif width > MAX_WIDTH
      @width = MAX_WIDTH
    else
      @width = width
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new('Hello world', 60)
puts banner

banner = Banner.new('Hello world', 200) # should default to 80
puts banner

banner = Banner.new('You either die a hero or live long enough to see yourself become the villian.', 20) # should default to message length
puts banner