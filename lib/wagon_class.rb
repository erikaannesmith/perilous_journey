require './lib/node_class'
require './lib/linked_list_class'

class WagonTrain
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(node, supplies = nil)
    list.append(node, supplies)
  end

  def prepend(node, supplies = nil)
    list.prepend(node, supplies)
  end

  def insert(insertion_point, node, supplies = nil)
    list.insert(insertion_point, node, supplies)
  end

  def count
    list.count
  end

  def supplies(node = list.head, supply_list = {})
    return supply_list if node.nil?
    if node.supplies !=nil
      supply_list.merge!(node.supplies)
    end
    supplies(node.next_node, supply_list)
  end
end
