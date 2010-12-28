require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  
  setup do
    Categorization.destroy_all
  end
  
  test "categorizations are unique" do
    c = Factory(:category)
    b = Factory(:brick)
    cz = Categorization.create(:brick => b, :category => c)
    assert cz.valid?
    
    cx = Categorization.new(:brick => b, :category => c)
    assert !cx.valid?
    
    b2 = Factory(:brick)
    cx.brick = b2
    assert cx.valid?
  end

  test "categorizations require bricks and categories" do
    cz = Categorization.new
    assert !cz.valid?
    
    cz.brick_id = 1
    assert !cz.valid?
    
    cz.category_id = 1
    assert cz.valid?
    
    cz.brick_id = nil
    assert !cz.valid?
  end




end
