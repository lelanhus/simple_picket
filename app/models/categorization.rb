class Categorization < ActiveRecord::Base
  belongs_to :brick
  belongs_to :category
  
  has_many :references, :as => :referenceable
  
  validates :brick_id, :presence => true, :uniqueness => { :scope => :category_id }
  validates :category_id, :presence => true
end
