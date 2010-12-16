class ReferencesController < InheritedResources::Base
  belongs_to :brickization, :relationship, :categorization, :polymorphic => true
  
  def create
    create! { parent }
  end
end
