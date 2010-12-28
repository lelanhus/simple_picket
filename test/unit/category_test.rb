require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  setup do
    Category.destroy_all
  end
  
  teardown do
    Category.destroy_all
  end

  test "categories must have a name" do
    assert Factory(:category).valid?
    assert !Factory.build(:category, :name => nil).valid?
  end
  
  test "categories have unique names" do
    name = "the same"
    Factory(:category, :name => name)
    assert !Factory.build(:category, :name => name).valid?
    assert Factory.build(:category, :name => "different").valid?
  end

  test "bricks returns the bricks in a category" do
    c = Factory(:category)
    5.times do
      b = Factory(:brick)
      Categorization.create(:brick => b, :category => c)
    end
    Factory(:brick)
    assert_equal Brick.all.length, 6
    assert_equal c.bricks.length, 5
  end




end
