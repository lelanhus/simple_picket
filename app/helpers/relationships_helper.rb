module RelationshipsHelper
  
  def render_the_form
    return render 'form' if @brick.nil? && @target.nil?
    return render 'source_form' if !@target.nil?
    return render 'target_form'
  end
end
