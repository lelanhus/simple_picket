class State < ActiveRecord::Base
  has_many :brickizations, :dependent => :destroy
  has_many :bricks, :through => :brickizations
  has_many :genders, :through => :brickizations
  has_many :species, :through => :brickizations
  
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  accepts_nested_attributes_for :brickizations
  
  validates :name, :presence => true, :uniqueness => true
end
