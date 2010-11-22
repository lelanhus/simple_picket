class StatesController < InheritedResources::Base
  belongs_to :brick, :gender, :species, :optional => true
end
