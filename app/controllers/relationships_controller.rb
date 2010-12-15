class RelationshipsController < InheritedResources::Base
  belongs_to :brick, :optional => true
  
  def new
    if params[:target].blank?
      new!
    else
      @target = Brick.find(params[:target])
      @relationship = Relationship.new
    end
  end

end
