module ReferencesHelper
  
  def new_reference_url
    msg = "Add another reference"
    return link_to msg, new_categorization_reference_url(parent) if parent_class.to_s == "Categorization" 
    return link_to msg, new_brickization_reference_url(parent) if parent_class.to_s == "Brickization"
    return link_to msg, new_relationship_reference_url(parent)
  end
end
