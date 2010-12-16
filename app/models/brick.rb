class Brick < ActiveRecord::Base
  has_many :brickizations, :dependent => :destroy
  has_many :states, :through => :brickizations
  has_many :genders, :through => :brickizations
  has_many :species, :through => :brickizations
  
  has_many :relationships
  has_many :targets, :through => :relationships
  
  has_many :sourcings, :class_name => "Relationship", :foreign_key => "target_id"
  has_many :sources, :through => :sourcings, :source => :brick
  
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  accepts_nested_attributes_for :brickizations
  
  validates :name, :presence => true, :uniqueness => true
  
  def potential_targets
    potentials(self.targets)
  end
  
  def potential_sources
    potentials(self.sources)
  end
  
  def potential_categories
    potentials(self.categories)
  end
  
  def potentials(objects)
    a = Brick.all
    a.delete(self)
    a.delete(objects)
    return a unless a.nil?
    return []
  end
  
end
