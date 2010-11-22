module StatesHelper
  
  def render_index
    return render 'brick_index' unless params[:brick_id].blank?
    render 'state_index'
  end
  
end