require 'minitest/autorun'
require 'minitest/pride'
require './lib/node_class'
require './lib/linked_list_class'

class LinkedListTest < MiniTest::Test
  def test_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_head_for_nil
    list = LinkedList.new

    assert_nil list.head
  end

  def test_to_string
    list = LinkedList.new
    list.append("Smith")
    list.append("Burke")

    assert_equal "The Smith family, followed by the Burke family", list.to_string
  end

  def test_to_string_for_three
    list = LinkedList.new
    list.append("Smith")
    list.append("Burke")
    list.append("West")

    assert_equal "The Smith family, followed by the Burke family, followed by the West family", list.to_string
  end

  def test_count_method
    list = LinkedList.new
    list.append("Smith")
    list.append("Burke")
    list.append("West")

    assert_equal 3, list.count
  end

  def test_prepend_method
    list = LinkedList.new
    list.append("Smith")
    list.append("West")
    list.prepend("Burke")

    assert_equal "The Burke family, followed by the Smith family, followed by the West family", list.to_string
  end

  def test_insert_method
    list = LinkedList.new
    list.append("Smith")
    list.append("Burke")
    list.append("Johnson")
    list.insert(2, "West")

    assert_equal "The Smith family, followed by the Burke family, followed by the West family, followed by the Johnson family", list.to_string
  end

  def test_find_method
    list = LinkedList.new
    list.append("Smith")
    list.append("Burke")
    list.append("John")
    list.append("West")

    assert_equal "The Burke family, followed by the John family, followed by the West family", list.find(1, 3)
  end

  def test_includes_method
    list = LinkedList.new
    list.append("Smith")
    list.append("Burke")
    list.append("West")

    assert list.includes?("Burke")
  end

  def test_pop_method
    list = LinkedList.new
    list.append("Smith")
    list.append("Burke")
    list.append("West")

    value = list.pop

    assert_equal "The Smith family, followed by the Burke family", list.to_string
  end
end
