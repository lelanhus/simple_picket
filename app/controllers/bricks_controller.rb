class BricksController < InheritedResources::Base
  belongs_to :gender, :species, :state, :optional => true
end
