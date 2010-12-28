require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  
  setup do
    Relationship.destroy_all
  end

  test "relationships should be unique" do
    r = Relationship.new
    r.brick_id = 1
    r.target_id = 2
    assert r.valid?
    
    r.save
    x = Relationship.new
    x.brick_id = 1
    x.target_id = 2
    assert !x.valid?
    
    x.target_id = 3
    assert x.valid?
    
    x.target_id = 2
    x.brick_id = 3
    assert x.valid?
  end

  test "brick and target cannot be the same" do
    r = Relationship.new
    r.brick_id = 1
    r.target_id = 1
    assert !r.valid?
  end


end
