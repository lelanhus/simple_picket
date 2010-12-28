class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :bricks, :through => :categorizations
  
  validates :name, :presence => true, :uniqueness => true
  
  def potential_bricks
    a = Brick.all
    a.delete(self.bricks)
    return a unless a.nil?
    return []
  end
end
