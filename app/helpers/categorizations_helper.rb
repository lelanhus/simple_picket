module CategorizationsHelper
  
  def render_the_form
    return render 'form' if @category.nil? && @brick.nil?
    return render 'category_form' if !@category.nil?
    return render 'brick_form'
  end
end
