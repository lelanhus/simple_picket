class EdgesController < InheritedResources::Base
  belongs_to :brickization, :optional => true
end
