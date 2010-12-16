class Categorization < ActiveRecord::Base
  belongs_to :brick
  belongs_to :category
end
