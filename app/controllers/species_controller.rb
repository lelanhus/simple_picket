class SpeciesController < InheritedResources::Base
  belongs_to :brick, :gender, :state, :optional => true
end
