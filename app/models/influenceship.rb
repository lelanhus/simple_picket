class Influenceship < ActiveRecord::Base
  belongs_to :brick
  belongs_to :influence
  
  validates :brick_id, :presence => true, :uniqueness => { :scope => :influence_id }
  validates :influence_id, :presence => true
end
