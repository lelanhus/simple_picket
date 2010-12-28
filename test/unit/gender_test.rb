require 'test_helper'

class GenderTest < ActiveSupport::TestCase

  setup do
    Gender.destroy_all
  end

  test "gender has name" do
    assert !Factory.build(:gender, :name => nil).valid?
  end
  
  test "gender name is unique" do
    name = "the same"
    Factory(:gender, :name => name)
    assert !Factory.build(:gender, :name => name).valid?
    assert Factory.build(:gender, :name => "different").valid?
  end

end
