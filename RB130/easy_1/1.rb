class Tree
  include Enumerable

  def each
    # ...
  end
end

tree = Tree.new
p tree.each # => nil

