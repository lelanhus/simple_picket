class Relationship < ActiveRecord::Base
  belongs_to :brick
  belongs_to :target, :class_name => "Brick"

  has_many :references, :as => :referenceable

end
