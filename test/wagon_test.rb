require 'minitest/autorun'
require 'minitest/pride'
require './lib/wagon_class'

class WagonTrainTest < MiniTest::Test
  def test_it_exists
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
  end

  def test_append_method
    wt = WagonTrain.new
    wt.append("Smith")

    assert_equal "Smith", wt.list.head.surname
  end

  def test_count_method
    wt = WagonTrain.new
    wt.append("Smith")
    wt.append("Burke")

    assert_equal 2, wt.count
  end

  def test_supplies_attribute
    wt = WagonTrain.new
    wt.append("Smith", {"oxen" => 2})

    assert_equal 2, wt.list.head.supplies["oxen"]
  end

  def test_prepend_with_supplies
    wt = WagonTrain.new
    wt.append("Smith")
    wt.prepend("Burke", {"oxen" => 3})

    assert_equal 3, wt.list.head.supplies["oxen"]
  end

  def test_supplies_method
    wt = WagonTrain.new
    wt.append("Smith", {"bulls" => 4})
    wt.prepend("Burke", {"oxen" => 3})

    assert({"bulls"=>4, "oxen"=>3}, wt.supplies)
  end
end
