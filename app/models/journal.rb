class Journal < ActiveRecord::Base
  has_many :references
  
  validates :pubmed_id, :presence => true, :uniqueness => true
end
