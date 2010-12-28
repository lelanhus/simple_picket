require 'test_helper'

class EdgeTest < ActiveSupport::TestCase
  
  setup do
    Edge.destroy_all
  end

  test "require a brickization and target" do
    assert Factory.build(:edge).valid?
    assert !Factory.build(:edge, :brickization => nil).valid?
    assert !Factory.build(:edge, :target_id => nil).valid?
  end

  test "edges are a unique set of brickization and target" do
    edge = Factory(:edge)
    bad_edge = Factory.build(:edge)
    bad_edge.brickization_id = edge.brickization_id
    bad_edge.target_id = edge.target_id
    assert !bad_edge.valid?
    
    bad_edge.brickization_id = edge.brickization_id + 1
    assert bad_edge.valid?
  end

  

end
