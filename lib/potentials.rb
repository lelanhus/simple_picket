module Potentials
  
  def potential_targets
    potentials(self.targets)
  end
  
  def potential_sources
    potentials(self.sources)
  end
  
  private
  
  def potentials(objects)
    all_objects = self.class.all
    all_objects.delete(self) 
    return all_objects - objects
  end
end