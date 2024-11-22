require 'pry'
=begin
# Circular Buffer

Your task is to write a CircularBuffer class that implements a circular buffer for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularBuffer::new, and should provide the following methods:

    put to add an object to the buffer
    get to remove (and return) the oldest object in the buffer. It should return nil if the buffer is empty.

You may assume that none of the values stored in the buffer are nil (however, nil may be used to designate empty spots in the buffer).

# PROBLEM
Create a CircularBuffer class. 

RULES:
- When initializing, take buffer size as an arg
- Need Method: Add to buffer
- Need method: remove and return oldest object (nil if empty)
- No values stored in buffer will be nil; can use nil as a default value
- Circular buffer follows FIFO: the oldest item is the one that was added first
- If buffer is full, must get rid of oldest object to add a new one
  - new object will take position of old object

- oldest element is at idx 0

# EXAMPLES
buffer = CircularBuffer.new(3) [ ]
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

# DATA STRUCTURES
NEEDS:
  #put
  #get
  # a way to track age of elements

# every time you add an element, increment end index
# start 0
# end 0
  add 1 [1]
# end 1
  # add 2 at idx 1  [1, 2]
# end 2
 # get 1 [2] (sub 1 from end)
# end 1
  # add 3 at idx 1 [2, 3]

full when size = input arg

start: Array with given number nil elements, or empty array

end: array

# BRAINSTORM
[] size = 3
 idx = 0
put 1
[1] idx = 1
put 2 (at idx 1)
[1, 2] idx = 2
get (at idx 0?) idx = 1
[2]
put 3
[2, 3] idx = 2
put 4
[2, 3, 4] idx = 3 (full? == yes)
get (at idx 0)
[3, 4] idx = 2
put 5
[3, 4, 5] idx = 3 (full? == yes)

if full?
 
 unshift to remove oldest element 3, [4, 5]
put 6 (at end) [4, 5, 6]
full? yes
put 7 [5, 6, 7]


# ALGO
- Initialize a new buffer with:
  @buffer - empty array
  @max_size - size value arg

- full?
 - check if size of @buffer == @max_size

- put(value)
  - IF full?
    - remove the first element in @buffer
  - push value into end of buffer

- get
  - remove and return first element in @buffer

# Want to try this implementation from Wiki:
In the beginning the indexes end and start are set to 0. The circular buffer write operation writes an element to the end index position and the end index is incremented to the next buffer position. The circular buffer read operation reads an element from the start index position and the start index is incremented to the next buffer position.

The start and end indexes alone are not enough to distinguish between buffer full or empty state while also utilizing all buffer slots,[5] but can be if the buffer only has a maximum in-use size of Length - 1.[6] In this case, the buffer is empty if the start and end indexes are equal and full when the in-use size is Length - 1. 
=end

class CircularBuffer
  def initialize(size)
    @buffer = []
    @max_size = size
  end

  def full?
    @buffer.size == @max_size
  end

  def put(value)
    @buffer.shift if full?
    @buffer << value
  end

  def get
    @buffer.shift
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil