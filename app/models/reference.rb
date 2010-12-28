class Reference < ActiveRecord::Base
  belongs_to :journal
  belongs_to :referenceable, :polymorphic => true
  
  validates :referenceable_type, :referenceable_id, :journal_id, :presence => true
  validates :referenceable_type, :uniqueness => { :scope => [:referenceable_id, :journal_id] }
end
