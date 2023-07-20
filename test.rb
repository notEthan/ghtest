require 'set'

class Ptr
  def ==(other)
    other.is_a?(Ptr)
  end

  alias_method :eql?, :==

  def hash
    h = @hash ||= {x: 0}.hash
    puts "Ptr#hash:  #{h}"
    h
  end
end

class Node
  def initialize
    @ptr = Ptr.new
    @node_set = Set[self]
  end

  attr_reader :node_set

  def ==(other)
    other.is_a?(Node)
  end

  alias_method :eql?, :==

  def hash
    h = {ptr: @ptr}.hash
    puts "Node#hash: #{h}"
    h
  end
end

$node = node = Node.new
post_node_set = Set[node]

puts
puts "post_node_set == node.node_set:"
puts  post_node_set == node.node_set
puts
puts "post_node_set.map(&:hash) == node.node_set.map(&:hash):"
puts  post_node_set.map(&:hash) == node.node_set.map(&:hash)
puts
puts "node.node_set == post_node_set:"
puts  node.node_set == post_node_set
puts
puts "node.node_set.map(&:hash) == post_node_set.map(&:hash):"
puts  node.node_set.map(&:hash) == post_node_set.map(&:hash)
