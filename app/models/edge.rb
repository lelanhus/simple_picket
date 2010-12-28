class Edge < ActiveRecord::Base
  belongs_to :brickization
  belongs_to :target, :class_name => "Brickization"

  has_many :references, :as => :referenceable
  
  validates :brickization_id, :target_id, :presence => true
  validates :brickization_id, :uniqueness => { :scope => :target_id }
end
