class Relationship < ActiveRecord::Base
  belongs_to :brick
  belongs_to :target
  
  validates :brick_id, :presence => true, :uniqueness => { :scope => :influence_id }
  validates :target_id, :presence => true
end
