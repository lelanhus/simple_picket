require 'test_helper'

class BrickizationTest < ActiveSupport::TestCase
  
  setup do
    Brickization.destroy_all
  end
  
  test "brickizations requires brick, state, gender, and species" do
    assert Factory(:brickization).valid?
    assert !Factory.build(:brickization, :brick_id => nil).valid?
    assert !Factory.build(:brickization, :gender_id => nil).valid?
    assert !Factory.build(:brickization, :state_id => nil).valid?
    assert !Factory.build(:brickization, :species_id => nil).valid?
  end
  
  test "brickizations contains a unique set of brick, gender, species, and state" do
    bz = Factory(:brickization)
    bad_bz = Factory.build(:brickization)
    bad_bz.brick = bz.brick
    bad_bz.gender = bz.gender
    bad_bz.state = bz.state
    bad_bz.species = bz.species
    assert !bad_bz.valid?
    
    bad_bz.brick = Factory(:brick)
    assert bad_bz.valid?
    
    bad_bz.brick = bz.brick
    bad_bz.gender = Factory(:gender)
    assert bad_bz.valid?
    
    bad_bz.gender = bz.gender
    bad_bz.species = Factory(:species)
    assert bad_bz.valid?
    
    bad_bz.species = bz.species
    bad_bz.state = Factory(:state)
    assert bad_bz.valid?
  end

  

end