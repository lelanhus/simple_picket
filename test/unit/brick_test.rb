require 'test_helper'

class BrickTest < ActiveSupport::TestCase
  
  setup do
    Brick.destroy_all
  end
  
  teardown do
    Brick.destroy_all
  end
  
  test "should be invalid without a name" do
    brick = Factory.build(:brick)
    brick.name = nil
    assert !brick.valid?
    
    brick.name = "happy"
    assert brick.valid?
  end
end
