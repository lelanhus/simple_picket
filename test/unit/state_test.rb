require 'test_helper'

class StateTest < ActiveSupport::TestCase

  setup do
    State.destroy_all
  end

  test "states have names" do
    assert !Factory.build(:state, :name => nil).valid?
  end

  test "state names are unique" do
    state = Factory(:state)
    state2 = Factory.build(:state, :name => state.name)
    assert !state2.valid?
    
    state2.name = "unique"
    assert state2.valid?
  end

  test "bricks returns the bricks for the state" do
    s = Factory(:state)
    5.times do
      b = Factory(:brick)
      Factory(:brickization, :brick => b, :state => s)
    end
    Factory(:brickization)
    assert_equal s.bricks.count, 5
  end
  
  test "genders returns the genders for the state" do
    s = Factory(:state)
    5.times do
      g = Factory(:gender)
      Factory(:brickization, :gender => g, :state => s)
    end
    Factory(:brickization)
    assert_equal s.bricks.count, 5
  end
  
  test "species returns the species for the state" do
    s = Factory(:state)
    5.times do
      g = Factory(:species)
      Factory(:brickization, :species => g, :state => s)
    end
    Factory(:brickization)
    assert_equal s.bricks.count, 5
  end
end
