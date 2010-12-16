class CategorizationsController < InheritedResources::Base
  belongs_to :brick, :optional => true
  belongs_to :category, :optional => true
end
