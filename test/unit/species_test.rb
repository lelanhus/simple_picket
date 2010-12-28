require 'test_helper'

class SpeciesTest < ActiveSupport::TestCase

  setup do
    Species.destroy_all
  end
  
  test "species has name" do
    assert !Factory.build(:species, :name => nil).valid?
    assert Factory.build(:species).valid?
  end
  
  test "species name is unique" do
    name = "the same"
    Factory(:species, :name => name)
    assert !Factory.build(:species, :name => name).valid?
    assert Factory.build(:species, :name => "different").valid?
  end

end
