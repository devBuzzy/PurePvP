Forem::Admin::MembersController.class_eval do
  def add
    user = Forem.user_class.where(:username => params[:user_id]).first
    if user.nil?
      flash[:alert] = "User not found"
      return redirect_to [:admin, group]
    end
    unless group.members.exists?(user.id)
      group.members << user
    end
    redirect_to [:admin, group]
  end
end