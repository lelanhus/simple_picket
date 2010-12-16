class Edge < ActiveRecord::Base
  belongs_to :brickization
  belongs_to :target, :class_name => "Brickization"

  has_many :references, :as => :referenceable
end
