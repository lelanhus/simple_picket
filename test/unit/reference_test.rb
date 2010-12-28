require 'test_helper'

class ReferenceTest < ActiveSupport::TestCase

  setup do
    Reference.destroy_all
  end
  
  test "reference has a referenceable_id, referenceable_type, and journal" do
    assert Factory.build(:reference).valid?
    assert !Factory.build(:reference, :referenceable_id => nil).valid?
    assert !Factory.build(:reference, :referenceable_type => nil).valid?
    assert !Factory.build(:reference, :journal_id => nil).valid?
  end
  
  test "that a reference is a unique set of referenceable_id, referenceable_type, and journal" do
    ref = Factory(:reference)
    bad_ref = Factory.build(:reference)
    bad_ref.referenceable_type = ref.referenceable_type
    bad_ref.referenceable_id = ref.referenceable_id
    bad_ref.journal_id = ref.journal_id
    assert !bad_ref.valid?
    
    bad_ref.journal_id = ref.journal_id + 1
    assert bad_ref.valid?
  end

end
