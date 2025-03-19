require 'pry'
=begin
# PROBLEM
Create a singly linked list implementation.

RULES:
- Each element in list contains data and a "next" field pointing to the subsequent element
- Linked list is LIFO: last in, first out
  - also called push-down/pop-off stack
- provide methods to reverse the linked list, convert linked list to/from an array
- need two classes: Element and LinkedList
- in a single-element list, that element is both the head and the tail

QUESTIONS:
- What should "next" field be for last item in the list? nil?
- Do items get added to beginning or end of linked list? - I think beginning?

# EXAMPLES
element [1] head & tail; next = nil
linkedlist [1]

push [2]
- creates Element.new(2)
- sets new element @next to head element in linked list
- adds new element to beginning (head spot) of linked list
[2] [1]

[element] [element] [element] <- tail, first added element
^head, last added element

[2] [1]
^ head
pushing element to list creates the link with next element

10 9 8 7 6 5 4 3 2 1 <-tail
^ head

pop 6, removes 10-5 (last in first out). remaining:
4 3 2 1 <- tail
^head

# DATA STRUCTURES
Element - value can be any type of object

LinkedList - each list stores @elements in an array

LinkedList obj can be converted to/from an Array obj


# ALGORITHM
Element
#constructor - takes 2 values, value of element, next element(optional, default to nil)
- assigns value to @datum
- assigns next element to @next

#datum - returns value of @datum

#tail? - returns true if element is last element is last in linked list (added first)

# next - returns next linked element
  - returns nil if element has no next element

SimpleLinkedList
# constructor
- @elements - array

# size - returns # of elements in list

# empty?
- check if @elements array is empty

# push - takes a value, adds to BEGINNING of linked list
  - creates a new Element obj, passing in given value
  - sets new element @next to head element in linked list
  - adds new element to beginning (head spot) of linked list

# peek - returns datum of head element in list
  - check if there is a head element in current list
    - if no, return nil
    - if yes, call #datum on that element and return that value

# head - returns most recently added element in list (first element in list)

# pop - removes and returns first element in list (most recently added)
  - return the datum of that element

# to_a - converts linked list to array
  - head element is first element in array
  - iterate through @elements - transform each element into its associated datum
  - return resulting array

# reverse - reverses order of list
  - head becomes tail
  - convert current list to an array
  - reverse the resulting array
  - create a new LinkedList with ::from_a, pass the array as an arg
  - returns the new LinkedList obj

::from_a - takes an array arg, creates a LinkedList from an array
  - create a new SimpleLinked List
  - return that list if the given array value is nil
  - reverse the given array
  - iterate through the array
    - create an element from the value
    - push the new Element into the new list
  - return the new list obj
=end

# class Element
#   attr_reader :datum, :next

#   def initialize(datum, next_element=nil)
#     @datum = datum
#     @next = next_element
#   end

#   def tail?
#     @next.nil?
#   end
# end

# class SimpleLinkedList
#   def initialize
#     @elements = []
#   end

#   def self.from_a(array)
#     new_list = SimpleLinkedList.new
#     return new_list if array.nil?
#     array.reverse.each { |item| new_list.push(item) }
#     new_list
#   end

#   def head
#     elements.first
#   end

#   def peek
#     head ? head.datum : nil
#   end

#   def size
#     elements.size
#   end

#   def to_a
#     elements.map(&:datum)
#   end

#   def reverse
#     SimpleLinkedList.from_a(to_a.reverse)
#   end

#   def push(value)
#     new_element = Element.new(value, head)
#     elements.unshift(new_element)
#   end

#   def pop
#     elements.shift.datum
#   end

#   def empty?
#     elements.empty?
#   end

#   private

#   attr_reader :elements
# end

#p SimpleLinkedList.from_a(nil)
#SimpleLinkedList.from_a([1, 2])

=begin
### REFACTOR
 - Make a solution WITHOUT storing each element in an @elements array!!!
  - make @head a property of the LinkedList
  -will need to change the value of head when pushing new element to list


# ALGORITHM
Element
#constructor - takes 2 values, value of element, next element(optional, default to nil)
- assigns value to @datum
- assigns next element to @next

#datum - returns value of @datum

#tail? - returns true if element is last element is last in linked list (added first)

# next - returns next linked element
  - returns nil if element has no next element

SimpleLinkedList
# size - returns # of elements
  - create a counter
  - iterate through all elements in the list
    - increment the counter for each element
  - return the counter

# each - iterates through whole linked list
  - set current_element to the head element
  - loop while current_element's @next value is truthy
    - yield current_element to the block
    - reassign current_element to current_element.next
    - stop looping when current_element's @next value is nil

# empty?
  - check if there is a head element
    - return true if no, false if yes

# push - takes a value, adds to BEGINNING of linked list
  - creates a new Element obj, passing in given value
  - sets new element @next to head element in list
  - assigns @head to new element

# peek - returns datum of head element in list
  - check if there is a head element in current list
    - if no, return nil
    - if yes, call #datum on that element and return that value

# head - reader; returns value of @head

# pop - removes and returns first element in list (most recently added)
  - return the datum of that element
  - assign first_element to the head element
  - assign @head to first_element.next
  - (?) set the @next property of first_element to nil? (do values get unlinked when popping them?)
  - return datum of first element

# to_a - converts linked list to array
  - head element is first element in array
  - create empty result array
  - iterate through all elements
    - push each element's datum to result array
  - return result array

# reverse - reverses order of list
  - convert current list to an array
  - reverse the array
  - convert array to new linked list
  - return new list

::from_a - takes an array arg, creates a LinkedList from an array
  - create a new SimpleLinkedList
  - return that list if the given array value is nil
  - reverse the given array
  - iterate through the array
    - create an element from the value
    - push the new Element into beginning of the new list
  - return the new list obj
=end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    counter = 0
    each { counter += 1 }
    counter
  end

  def empty?
    head.nil?
  end

  def peek
    #head ? head.datum : nil
    head.datum if head
  end

  def push(value)
    new_element = Element.new(value, head)
    self.head = new_element
  end

  def pop
    # return nil if empty?
    # first_element = head
    # self.head = head.next
    # first_element.datum
    datum = peek
    self.head = head.next unless head.nil? # can use conditional here instead
    datum
  end

  def to_a
    result = []
    each { |element| result << element.datum }
    result
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def each
    current_element = head
    while current_element
      yield(current_element)
      current_element = current_element.next
    end
    self
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?
    array.reverse.each { |value| list.push(value) }
    list
  end

  private

  attr_writer :head
end
