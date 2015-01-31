Forem::Admin::GroupsController.class_eval do
  layout 'application'

  def update
    @group = Forem::Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:notice] = 'Successfully updated group'
      redirect_to [:admin, @group]
    else
      flash[:alert] = 'Unable to save group changes'
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :color, :badge_color, :badge_text, :priority)
  end

end