require 'test_helper'

class BrickTest < ActiveSupport::TestCase
  
  setup do
    Brick.destroy_all
  end
  
  teardown do
    Brick.destroy_all
  end
  
  test "brick is invalid without a name" do
    brick = Factory.build(:brick, :name => nil)
    assert !brick.valid?
    
    brick.name = "happy"
    assert brick.valid?
  end
  
  test "bricks have unique names" do
    brick = Factory(:brick, :name => "brick1")
    brick2 = Factory.build(:brick, :name => "brick1")
    assert !brick2.valid?
    
    brick2.name = "brick2"
    assert brick2.valid?
  end

  test "targets returns the targets for a brick" do
    brick = Factory(:brick)
    3.times do
      Factory(:relationship, :brick_id => brick.id)
    end
    Factory(:relationship)
    assert_equal brick.targets.length, 3
  end
  
  test "sources returns a targets sources" do
    brick = Factory(:brick)
    3.times do
      Factory(:relationship, :target_id => brick.id)
    end
    Factory(:relationship)
    assert_equal brick.sources.length, 3
  end

  test "potential_targets returns potential targets" do
    b = Factory(:brick)
    3.times do
      Factory(:relationship, :brick_id => b.id)
    end
    c = Factory(:brick)
    assert_equal b.potential_targets.length, 1
  end
  
  test "potential_sources returns potential sources" do
    b = Factory(:brick)
    3.times do
      Factory(:relationship, :target_id => b.id)
    end
    c = Factory(:brick)
    assert_equal b.potential_sources.length, 1
  end
  
end
