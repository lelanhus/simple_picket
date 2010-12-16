class Brickization < ActiveRecord::Base
  belongs_to :brick
  belongs_to :state
  belongs_to :species
  belongs_to :gender
  
  has_many :references, :as => :referenceable
  
  validates :brick_id, :uniqueness => { :scope => [:gender_id, :species_id, :state_id] }
  validates_presence_of :gender_id, :species_id, :state_id
end
