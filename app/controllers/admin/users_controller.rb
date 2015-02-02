class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def edit
  end

  def destroy
    @user.destroy
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'Successfully updated user'
      redirect_to [:admin, @user]
    else
      flash[:alert] = 'Unable to save user changes'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :uuid, :color, :badge_color, :badge_text, :forem_admin, :forem_auto_subscribe, :rank)
  end

  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end
end
