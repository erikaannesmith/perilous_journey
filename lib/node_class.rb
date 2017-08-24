
class Node
  attr_accessor :next_node, :surname, :supplies

  def initialize(node, supplies = nil)
    @surname = node
    @next_node = next_node
    @supplies = supplies
  end
end
