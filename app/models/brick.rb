class Brick < ActiveRecord::Base
  has_many :brickizations, :dependent => :destroy
  has_many :states, :through => :brickizations
  has_many :genders, :through => :brickizations
  has_many :species, :through => :brickizations
  
  has_many :targets, :dependent => :destroy
  has_many :targets, :through => :relationships
  
  has_many :sources, :class_name => "Relationships", :foreign_key => "target_id", :dependent => :destroy
  has_many :sources, :through => :sources, :source => :brick
  
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  accepts_nested_attributes_for :brickizations
  
  validates :name, :presence => true, :uniqueness => true
  
end
