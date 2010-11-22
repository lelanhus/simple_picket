class Brick < ActiveRecord::Base
  has_many :brickizations, :dependent => :destroy
  has_many :states, :through => :brickizations
  has_many :genders, :through => :brickizations
  has_many :species, :through => :brickizations
  
  has_many :influenceships, :dependent => :destroy
  has_many :influences, :through => :influenceships
  
  has_many :non_influenceships, :class_name => "Influenceships", :foreign_key => "influence_id", :dependent => :destroy
  has_many :non_influences, :through => :non_influenceships, :source => :brick
  
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  accepts_nested_attributes_for :brickizations
  
  validates :name, :presence => true, :uniqueness => true
  
end
