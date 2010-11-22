class BricksController < InheritedResources::Base
  belongs_to :gender, :species, :state, :optional => true
  
  def new
    @brick = Brick.new
    @brick.brickizations.build
  end
end
