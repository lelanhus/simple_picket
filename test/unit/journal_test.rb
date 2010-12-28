require 'test_helper'

class JournalTest < ActiveSupport::TestCase

  setup do
    Journal.destroy_all
  end

  test "journal has a pubmed_id" do
    assert Factory.build(:journal).valid?
    assert !Factory.build(:journal, :pubmed_id => nil).valid?
  end
  
  test "pubmed_id's are unique" do
    journal = Factory(:journal)
    bad_journal = Factory.build(:journal)
    bad_journal.pubmed_id = journal.pubmed_id
    assert !bad_journal.valid?
    
    bad_journal.pubmed_id = journal.pubmed_id + 1
    assert bad_journal.valid?
  end

end
