class Brickization < ActiveRecord::Base
  belongs_to :brick
  belongs_to :state
  belongs_to :species
  belongs_to :gender
  
  has_many :references, :as => :referenceable
  
  has_many :edges
  has_many :targets, :through => :edges
  
  has_many :sourcings, :class_name => "Edge", :foreign_key => "target_id"
  has_many :sources, :through => :sourcings, :source => :brickizations
  
  validates :brick_id, :uniqueness => { :scope => [:gender_id, :species_id, :state_id] }
  validates_presence_of :gender_id, :species_id, :state_id
end
