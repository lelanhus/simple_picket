class BricksController < InheritedResources::Base
  belongs_to :gender, :species, :state, :optional => true
  before_filter :find_brick, :only => [:targets, :sources]
  
  def new
    @brick = Brick.new
    @brick.brickizations.build
  end
  
  def index
    @bricks = Brickization.all
  end
  
  def targets
    @targets = @brick.targets
  end
  
  def sources
    @sources = @brick.sources
  end
  
  private
  
  def find_brick
    @brick = Brick.find(params[:id])
  end
end
