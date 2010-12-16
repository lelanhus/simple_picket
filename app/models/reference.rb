class Reference < ActiveRecord::Base
  belongs_to :journal
  belongs_to :referenceable, :polymorphic => true
end
