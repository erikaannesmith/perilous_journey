require './lib/node_class'

class LinkedList
  attr_accessor :head, :node

  def initialize(head = nil)
    @head = head
  end

  def append(name, supplies = nil, node = @head)
    if @head.nil?
      @head = Node.new(name, supplies)
    elsif node.next_node.nil?
      node.next_node = Node.new(name, supplies)
    else
      append(name, supplies, node.next_node)
    end
  end

  def count(node = @head, internal_count = 0)
    return internal_count if node.nil?

    count(node = node.next_node, internal_count + 1)
  end

  def to_string(node = @head)
    append_next_family("The #{node.surname} family", node.next_node)
  end

  def prepend(name, supplies = nil)
    if @head.nil?
      @head = Node.new(name, supplies)
    else
      old_head = @head
      new_head = Node.new(name, supplies)
      new_head.next_node = old_head
      @head = new_head
    end
  end

  def insert(insertion_point, name, supplies = nil)
    inserted_node = Node.new(name, supplies)
    if @head.nil?
      @head = inserted_node
    elsif insertion_point == 0
        prepend(name)
      elsif insertion_point == self.count
        append(name)

    else
      find_insertion_point(insertion_point, inserted_node)
    end
  end

  def find(index, list_length, statement = "", current_node = @head)
    index.times do
      current_node = current_node.next_node
    end
    statement << "The #{current_node.surname} family"
    (list_length-1).times do
      current_node = current_node.next_node
      statement << ", followed by the #{current_node.surname} family"
    end
    statement
  end

  def includes?(name, node = @head)
    return false if node.nil?

    node.surname == name || includes?(name, node.next_node)
  end

  def pop(node = @head)
    they_died = second_to_last_node(node)
    if they_died
      p "The #{node.next_node.surname} family has died of dysentery"
      node.next_node = nil
    else
      pop(node.next_node)
    end
  end

  private

  def second_to_last_node(node)
    node.next_node.next_node.nil?
  end

  def append_next_family(statement, node)
    return statement if node.nil?
    statement << ", followed by the #{node.surname.capitalize} family"
    append_next_family(statement, node.next_node)
  end

  def find_tail(current_head, index, count = 0, root = @head)
    if index != count
      count +=1
      find_tail(current_head, index, count, root.next_node)
    else
      root.next_node = current_head
    end
  end

  def find_insertion_point(index, inserted_node, current_head = @head, count = 0)
    if count != index
      count +=1
      find_insertion_point(index, inserted_node, current_head.next_node, count)
    else
      inserted_node.next_node = current_head
      current_head = inserted_node
      find_tail(current_head, count-1)
    end
  end

  def is_last_node?(node)
    node.next_node.nil?
  end
end
