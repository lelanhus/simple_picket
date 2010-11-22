class GendersController < InheritedResources::Base
  belongs_to :brick, :species, :state, :optional => true
end
