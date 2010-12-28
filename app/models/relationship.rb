class Relationship < ActiveRecord::Base
  belongs_to :brick
  belongs_to :target, :class_name => "Brick"

  has_many :references, :as => :referenceable
  
  validates :brick_id, :uniqueness => { :scope => :target_id }
  
  validate :source_is_not_target
  
  private
  
  def source_is_not_target
    errors.add(:target_id, "cannot be itself.") if self.brick_id == self.target_id
  end
end
