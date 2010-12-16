class Categorization < ActiveRecord::Base
  belongs_to :brick
  belongs_to :category
  
  has_many :references, :as => :referenceable
end
